#include "openpdf.h"
#include <QDir>
#include <QFileInfo>
#include <QDebug>
#include <QFile>
#include <QTextStream>
#include <QImage>
#include <QtWidgets>
//static const QString PATH_TO_EXAMPLE = QDir::homePath() + "/Example/";
static QString PATH = QDir::homePath() + "/Example/";

OpenPDF::OpenPDF(QObject *parent): QAbstractListModel (parent)
{
    QDir way(PATH/*_TO_EXAMPLE*/);
    m_openpdf = way.entryInfoList(QDir::AllEntries | QDir::NoDotAndDotDot);
    qDebug() << QDir::homePath();
    QString temp = PATH;
    temp.remove(temp.size() - 1, 1);
    qDebug() << PATH;
}

QVariant OpenPDF::data(const QModelIndex &index, int role) const {

    if(!index.isValid())
        return QVariant();
    switch (role) {
    case Name:
        return m_openpdf[index.row()].fileName();
    case Path:
        return m_openpdf[index.row()].filePath();
    }
    return QVariant();
}

int OpenPDF::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent)
    return m_openpdf.length();
}

QHash<int, QByteArray>OpenPDF::roleNames() const {
    QHash<int, QByteArray> role;
    role[Name]="name";
    role[Path] ="path";
    return role;
}

void OpenPDF::renameFile(QString name, QString newName)
{
    QFile file(PATH + name);
    if(file.exists()) {
        file.rename(PATH + newName);
    }

    OpenPDF::update();
}

void OpenPDF::openFile(const QString name)
{
    QFile file(PATH + name);
    if(file.exists()) {
        file.open(QIODevice::ReadOnly | QFile::Text);
    } else {
        qDebug() << "asasas";
    }
    QTextStream stream(&file);
    QString pzdc = stream.readAll();
    qDebug() << pzdc;
    file.close();
    setLabel2(pzdc);
}

void OpenPDF::createFile(const QString name)
{
    QFile mFile(PATH + name);
    mFile.open(QIODevice::WriteOnly);
    if (mFile.exists()) {
        qDebug() << "Файл существует, создать не получится!";
    }
    mFile.close();

    OpenPDF::update();
}

void OpenPDF::removeFile(const QString name)
{
    QFile mFile(PATH + name);
    if (mFile.exists()) {
        qDebug() << "Файл удалился!";
    } else {
        qDebug() << "Файл ненайден!";
    }
    mFile.remove();

    OpenPDF::update();
}

void OpenPDF::nextFolder(const QString name)
{
    PATH = PATH + name + "/";

    OpenPDF::update();
    qDebug() << PATH << "nextFolder";
}

void OpenPDF::previousFolder()
{
    QString temp = PATH;
    if (temp.size() > 2) {
        temp.remove(temp.size() - 1, 1);
        int k = 0;
        for (int i = temp.size(); (QChar)temp[i] != "/"; i--) {
            k++;
        }
        if (temp.size() - k > 1) {
            temp.remove(temp.size() - k, k);
            PATH = temp + "/";
        }
    }

    OpenPDF::update();
    qDebug() << PATH << "previousFolder";
}

//void OpenPDF::openImage(const QString name)
//{
//    QScrollArea  sa;

//    QWidget*     pwgt = new QWidget;
//    QPixmap      pix(PATH_TO_EXAMPLE + name);

//    QPalette pal;
//    pal.setBrush(pwgt->backgroundRole(), QBrush(pix));
//    pwgt->setPalette(pal);
//    pwgt->setAutoFillBackground(true);
//    pwgt->setFixedSize(pix.width(), pix.height());


//    pwgt->show();
//}


QString OpenPDF::label2() const
{
    return m_label2;
}

void OpenPDF::setLabel2(QString label2)
{
    if (m_label2 == label2)
        return;

    m_label2 = label2;
    emit label2Changed(m_label2);
}

void OpenPDF::pressButton()
{
    qDebug() << "pressButton";
    someNewWindow = new NewWindow();
}

void OpenPDF::update()
{
    m_openpdf.clear();
    QDir way(PATH);
    m_openpdf = way.entryInfoList(QDir::AllEntries | QDir::NoDotAndDotDot);
    beginResetModel();
    endResetModel();
}
