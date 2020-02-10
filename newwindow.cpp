#include "newwindow.h"
#include <QWidget>
#include <QDebug>

NewWindow :: NewWindow(QWidget* pwgt/*= 0*/)
    : QDialog(pwgt, Qt::WindowTitleHint | Qt::WindowSystemMenuHint) {

    qDebug() << "NewWindow";
    this->setWindowTitle("123456789");
    this->resize(400,500);
    this->
    openImage();
    this->show();

}

void NewWindow::openImage()
{
    QPixmap pix("C:/Users/User/Desktop/img.jpg");
    QPalette pal;
    pal.setBrush(this->backgroundRole(), QBrush(pix));
    this->setPalette(pal);
    this->setAutoFillBackground(true);
}
