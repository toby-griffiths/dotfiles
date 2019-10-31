<?php
declare(strict_types=1);

namespace TobyGriffiths\DotFiles\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;


/**
 * Console command to add a dotfile to the dotfiles repo
 *
 * @package TobyGriffiths\DotFiles
 */
class AddFileCommand extends Command
{
    public const NAME = 'file:add';

    private const ARG_FILENAME = 'filename';

    /**
     * Location of the dotfiles to be installed.
     *
     * @var string
     */
    private $filesDir;

    /**
     * Injects config
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
            ->setDescription('Adds a dotfile to the dotfiles repository.')
            ->setHelp(
                sprintf(
                    'To add an existing dotfile from your home directory, simple call the \'%s\' command, passing the ' .
                    'file name.
                    
                    This command uses the value of the $HOME environment variables to calculate the file\'s location.
                    
                    Note: You can only add files from the root of your home directory, as this is where they\'ll be ' .
                    'symlinked back to when you run setup.',
                    self::NAME
                )
            )
            ->addArgument(
                self::ARG_FILENAME,
                InputArgument::REQUIRED,
                'The name of the dotfile to be added.  This must be in the current user\'s $HOME directory.'
            );
    }


    /**
     * @inheritdoc
     */
    protected function execute(InputInterface $input, OutputInterface $output): ?int
    {
        if (!isset($_SERVER['HOME'])) {

            $output->writeln(
                '<error>Unable to determine home directory as $HOME environemtn variable is not set.</error>'
            );

            return 1;

        }

        $homeDir = $_SERVER['HOME'];

        $relativeFilePath = $input->getArgument(self::ARG_FILENAME);

        $fileToBeAdded = new \SplFileInfo("{$homeDir}/$relativeFilePath");

        if (!$fileToBeAdded->getRealPath()) {

            $output->writeln(
                "<error>Unable to find fileToBeAdded {$fileToBeAdded->getPathname()}</error>"
            );

            return 1;

        }

        if ($fileToBeAdded->isLink()) {

            $output->writeln('<error>You cannot add symlinks.</error>');

            return 1;

        }

        $targetFile = new \SplFileInfo(
            sprintf(
                '%s/%s',
                $this->filesDir,
                preg_replace('/^\./', '', $fileToBeAdded->getBasename())
            )
        );

        if (file_exists($targetFile->getPathname())) {

            $output->writeln(
                "<error>Dotfile '{$fileToBeAdded->getBasename()}' has already been added.</error>"
            );

            return 1;


        }

        if (!rename($fileToBeAdded->getPathname(), $targetFile->getPathname())) {

            $output->writeln('<error>Unable to move file to dotfiles directory.</error>');

            return 1;

        }

        $output->writeln('<info>File added to dotfiles</info>');

        if (!symlink($targetFile->getPathname(), $fileToBeAdded->getPathname())) {

            $output->writeln('<error>Unable to add symlink to home directory.</error>');

            return 1;

        }

        $output->writeln('<info>... and symlinked back to $HOME.</info>');

        return 0;
    }

}
