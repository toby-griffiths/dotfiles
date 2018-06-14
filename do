#!/usr/bin/env php
<?php

namespace TobyGriffiths\DotFiles;

error_reporting(E_ALL);
ini_set('display_errors', 1);

require __DIR__ . '/vendor/autoload.php';

use Symfony\Component\Console\Application;
use Symfony\Component\Console\CommandLoader\FactoryCommandLoader;
use TobyGriffiths\DotFiles\Command as Commands;

const PROJECT_NAMESPACE = 'TobyGriffiths';

/** @var Application $application */
$application = new Application();

$filesDir = __DIR__ . '/files';

$application->setCommandLoader(new FactoryCommandLoader([
    Commands\SetupCommand::NAME => function () use ($filesDir) {
        return new Commands\SetupCommand(Commands\SetupCommand::NAME, $filesDir);
    },
    Commands\AddFileCommand::NAME => function () use ($filesDir) {
        return new Commands\AddFileCommand(Commands\AddFileCommand::NAME, $filesDir);
    },
]));


/** @noinspection PhpUnhandledExceptionInspection */
$application->run();
