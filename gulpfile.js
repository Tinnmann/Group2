const gulp = require('gulp'),
    path = require('path'),
    pug = require('gulp-pug'),
    sass = require('gulp-sass')
browserSync = require('browser-sync');

const SITE_DIR = 'public',
    SASS_DIR = 'sass',
    CSS_DIR = 'public/css';

/**
 * pug compiler

gulp.task('pug', function(){
    gulp.src('pug/*.pug')
        .pipe(pug({pretty: true}))
        .pipe(gulp.dest(SITE_DIR))
        .pipe(browserSync.reload({stream: true}))
})
*/
/**
 * sass compiler
 */
gulp.task('sass', function(){
    return gulp.src(SASS_DIR + '/*.sass')
        .pipe(sass({
            includePaths: SASS_DIR,
        }))
        .pipe(gulp.dest(CSS_DIR))
        .pipe(browserSync.reload({stream: true}))
})

gulp.task('browser-sync', ['sass', 'pug'],function(){
    browserSync({
        server: {baseDir: SITE_DIR},
        notify: true
    })
})

gulp.task('watch', function(){
    gulp.watch(SASS_DIR + '/**', ['sass'])
    gulp.watch(['*pug', '**/*.pug'], ['pug'])
})

gulp.task('default', ['browser-sync', 'watch'])
