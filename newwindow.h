#ifndef NEWWINDOW_H
#define NEWWINDOW_H

#include <QObject>
#include <QWidget>
#include <QPushButton>
#include <QMainWindow>
#include <QGuiApplication>
#include <QDialog>

class NewWindow : public QDialog
{
public:

    NewWindow(QWidget *parent = nullptr);
    void openImage();


private:

};

#endif // NEWWINDOW_H
