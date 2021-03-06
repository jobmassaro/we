<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit6e117398995f20fc6fcff848e9655e1b
{
    public static $prefixLengthsPsr4 = array (
        'M' => 
        array (
            'Models\\' => 7,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Models\\' => 
        array (
            0 => __DIR__ . '/../..' . '/lib/classes',
        ),
    );

    public static $classMap = array (
        'Models\\Action' => __DIR__ . '/../..' . '/lib/classes/Action.php',
        'Models\\Mysql' => __DIR__ . '/../..' . '/lib/classes/Mysql.php',
        'Models\\User' => __DIR__ . '/../..' . '/lib/classes/User.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit6e117398995f20fc6fcff848e9655e1b::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit6e117398995f20fc6fcff848e9655e1b::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit6e117398995f20fc6fcff848e9655e1b::$classMap;

        }, null, ClassLoader::class);
    }
}
