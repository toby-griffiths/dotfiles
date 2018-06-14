#!/usr/bin/env php
<?php

namespace TobyGriffiths\DotFiles;

error_reporting(E_ALL);
ini_set('display_errors', 1);

require __DIR__ . '/vendor/autoload.php';

use Symfony\Component\Console\Application;
use Symfony\Component\Console\CommandLoader\FactoryCommandLoader;
use TobyGriffiths\DotFiles\Command\SetupCommand;

const PROJECT_NAMESPACE = 'TobyGriffiths';

/** @var Application $application */
$application = new Application();

$application->setCommandLoader(new FactoryCommandLoader([
    SetupCommand::NAME => function () {
        return new SetupCommand(SetupCommand::NAME, __DIR__ . '/files');
    }
]));


/** @noinspection PhpUnhandledExceptionInspection */
$application->run();
