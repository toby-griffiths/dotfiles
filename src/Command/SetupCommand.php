<?php
declare(strict_types=1);

namespace TobyGriffiths\DotFiles\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Finder\Finder;
use Symfony\Component\Finder\SplFileInfo;

/**
 * Installs all the dot files
 *
 * @package TobyGriffiths\DotFiles
 */
class SetupCommand extends Command
{
    public const NAME = 'setup';


    /**
     * Location of the dotfiles to be installed.
     *
     * @var string
     */
    private $filesDir;

    /**
     * SetupCommand constructor.
     *
     * @param string $name
     * @param string $filesDir
     */
    public function __construct(string $name, string $filesDir)
    {
        parent::__construct($name);

        $this->filesDir = $filesDir;
    }


    /**
     * @inheritdoc
     */
    protected function configure(): void
    {
        $this
            ->setName(self::NAME)
            ->setDescription('Symlinks all the dot files into the user\'s home directory');
    }


    /**
     * @inheritdoc
     */
    protected function execute(InputInterface $input, OutputInterface $output): ?int
    {
        $finder = new Finder();

        $finder
            ->in($this->filesDir)
            ->ignoreDotFiles(false)
            ->depth(0)
            ->sortByName();

        $output->writeln('<info>Symlinking...</info>');

        // Symlink files
        foreach ($finder as $file) {

            /** @var SplFileInfo $file */

            $userFile = new \SplFileInfo($_SERVER['HOME'] . '/.' . $file->getBasename());

            $output->write(sprintf('<info>* %s…</info> ', $userFile));

            $output->write(" ({$file->getRealPath()}) ");

            // Check if a link first, as using getRealPath() will return false for links that exists, but are broken

            if ($userFile->isLink()) {

                // Checks if link target is a valid file
                if (!$userFile->getRealPath()) {

                    $this->displayError($output, 'Symlink already exists, but is broken (invalid target)');

                    $output->writeln('Expecting: ' . $file->getPathname());
                    $output->writeln('Actual:    ' . $userFile->getLinkTarget());

                    return 1;

                }

                if ($userFile->getRealPath() !== $file->getRealPath()) {

                    $this->displayError(
                        $output,
                        sprintf(
                            'Symlink already exists, but points to another location (%s)',
                            $userFile->getRealPath()
                        )
                    );

                    $this->showProblemAdvice($output, $userFile, $file);

                    return 1;

                }

                $output->writeln(' Already symlinked');

                continue;

            }

            // Checks if the non-link file actually exists
            if ($userFile->getRealPath()) {

                $output->writeln(sprintf('<error>\'%s\' already exists</error>', $userFile));

                $this->showProblemAdvice($output, $userFile, $file);

                return 1;

            }

            symlink($file->getRealPath(), $userFile->getPathname());

            $output->writeln(' Done');

        }

        return 0;
    }

    /**
     * @param OutputInterface $output
     * @param string $errorMessage
     */
    protected function displayError(OutputInterface $output, string $errorMessage): void
    {
        $output->writeln(sprintf('<error>%s</error>', $errorMessage));
    }

    /**
     * @param OutputInterface $output
     * @param SplFileInfo $userFile
     * @param SplFileInfo $file
     */
    protected function showProblemAdvice(OutputInterface $output, \SplFileInfo $userFile, \SplFileInfo $file): void
    {
        $output->writeln('');
        $output->writeln('To view the difference between these file, run...');
        $output->writeln(sprintf('diff %s %s', $userFile->getRealPath(), $file->getRealPath()));

        if ($userFile->isFile() && $userFile->isReadable()) {
            $output->writeln('');
            $output->writeln('To copy the existing file content to the clipboard, run...');
            $output->writeln(sprintf('cat %s | pbcopy', $userFile->getRealPath()));
        }

        $output->writeln('');

    }

}