#include <QCoreApplication>
#include <QDebug>
#include <QFile>
#include <iostream>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <stdlib.h>
#include <QList>

void readFile(QString filePath)
{
      QString val;
      QFile file;
      file.setFileName(filePath);
      file.open(QIODevice::ReadOnly | QIODevice::Text);
      val = file.readAll();
      file.close();
      qDebug() << val;
      QJsonDocument d = QJsonDocument::fromJson(val.toUtf8());
      QJsonObject sett2 = d.object();
      QJsonValue value = sett2.value(QString("appName"));
          //qDebug() << value;
      QJsonObject item = value.toObject();
          //qDebug() << "QJsonObject of description: " << item;

          /* in case of string value get value and convert into string*/
          //qDebug() << "QJsonObject[appName] of description: " << item["description"];
      QJsonValue subobj = item["description"];
      qDebug() << subobj.toString();

          /* in case of array get array and convert into string*/
         // qDebug() << "QJsonObject[appName] of value: " << item["imp"];
      QJsonArray test = item["imp"].toArray();
      qDebug() << test[1].toString();
	  qDebug() << test[2].toString();
}




class AppData : public QObject
{
public:
    AppData();
    ~AppData();
    QString getValue(QString path, QString key, QString keyAttribute, QString subObject) const;
    void setValue();

    QList<QString> listData(QString path, QString key);

    QString getHighestTemp(QString path, QString key) const;
    QString getLowestTemp(QString path, QString key) const;

    QList<QString> getListTemp() const;

private:
    QString m_Temperature;
    QString m_Humidity;
    QString m_WindSpeed;
    QString m_ChanceOfRain;

    // highest and lowest temperature
    QString highestTemp;
    QString lowestTemp;

    // luu danh sach nhiet do tung gio trong 24h
    QList<QString> temp;
};

AppData::AppData()
{

}

AppData::~AppData(){}

QList<QString> AppData::getListTemp() const
{
    return temp;
}

// get somes value refer to key inserted


// get highest temperature
QString AppData::getHighestTemp(QString path, QString key) const
{
    QString val;
    QFile file;

    // open, read file then close
    file.setFileName(path);
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    val = file.readAll();
    file.close();

    QJsonDocument doc = QJsonDocument::fromJson(val.toUtf8());
    QJsonObject object = doc.object();
    QJsonValue value = object.value(key);

    //highestTemp = value.toString();
    QJsonObject obj = value.toObject();


    return obj["Nhietdocaonhat"].toString();
}

// get lowest temperature
QString AppData::getLowestTemp(QString path, QString key) const
{
    QString val;
    QFile file;

    // open, read file then close
    file.setFileName(path);
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    val = file.readAll();
    file.close();

    QJsonDocument doc = QJsonDocument::fromJson(val.toUtf8());
    QJsonObject object = doc.object();
    QJsonValue value = object.value(key);

    //highestTemp = value.toString();
    QJsonObject obj = value.toObject();

    return obj["Nhietdothapnhat"].toString();
}

QList<QString> AppData::listData(QString path, QString key)
{
    QString val;
    QFile file;
    //QList<QString> data;

     // open file
    file.setFileName(path);
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    val = file.readAll();
    file.close();

    QJsonDocument doc = QJsonDocument::fromJson(val.toUtf8());
    QJsonObject object = doc.object();
    QJsonValue value = object.value(key);

    QJsonArray _listTempData = value["Nhietdo"].toArray();

    qDebug() << "list->" << _listTempData << "\n";

    //append data in json array to list
    foreach(const QJsonValue& val, _listTempData)
    {
        AppData::temp.append(val.toString());
    }

    return AppData::temp;
}

QString AppData::getValue(QString path, QString key, QString keyAttribute, QString subObject) const
{
    //Q_UNUSED(key);
    //QString value = "";
    qDebug() << "path->" << path << "\n";

    QString val;
    QFile file;
    file.setFileName(path);
    file.open(QIODevice::ReadOnly | QIODevice::Text);

    val = file.readAll();
    QJsonDocument jdoc = QJsonDocument::fromJson(val.toUtf8());
    QJsonObject object = jdoc.object();

    QJsonValue value = object.value(key);
    QString ret;

    // den doan nay da lay dc sub value ra roi
    //qDebug() << value << "\n";
    if(subObject.length() != 0){
        ret = value[keyAttribute][subObject.remove(1,subObject.length()-1).toInt()].toString();
    }else{
        ret = value[keyAttribute].toString();
    }

    return ret;
}


int main()
{
    AppData dat;

    QString value = dat.getValue("data.json", "Hanoi", "Nhietdo", "2AM");

    qDebug() << value;

    //QList<QString> list = dat.listData("data.json","Hanoi");

    dat.listData("data.json", "Hanoi");

    QList<QString> list = dat.getListTemp();

    foreach(QString l, list)
    {
        qDebug() << l << "\n";
    }

    qDebug() << "highest HN->" << dat.getHighestTemp("data.json", "Hanoi") << "\n";
    qDebug() << "lowest HN->" << dat.getLowestTemp("data.json","Hanoi") << "\n";

    return 0;
}
