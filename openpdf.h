#ifndef OPENPDF_H
#define OPENPDF_H
#include <QAbstractListModel>
#include <QObject>
#include <QFileInfo>
#include <QFile>
#include "newwindow.h"

class OpenPDF: public QAbstractListModel
{
    Q_OBJECT
public:
    OpenPDF(QObject *parent = nullptr);

    enum Roles{
        Name,
        Path
    };

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void renameFile(QString path, QString newName);
    Q_INVOKABLE void openFile(const QString name);
    Q_INVOKABLE void createFile(const QString name);
    Q_INVOKABLE void removeFile(const QString name);
    Q_INVOKABLE void nextFolder(const QString name);
    Q_INVOKABLE void previousFolder();
//    Q_INVOKABLE void openImage(const QString name);
    Q_PROPERTY(QString label2 READ label2 WRITE setLabel2 NOTIFY label2Changed)
    Q_INVOKABLE void pressButton();


    
    QString label2() const;

public slots:
    void setLabel2(QString label2);


signals:
    void label2Changed(QString label2);

private:
    QList<QFileInfo> m_openpdf;
    QString m_label2;
    NewWindow *someNewWindow;
    void update();
};

#endif // OPENPDF_H
