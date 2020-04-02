# Generated by Django 3.0.4 on 2020-03-27 07:01

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Paste',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('paste_data', models.TextField(help_text='The data that you want to share in this pastebin post.', verbose_name='Paste Data')),
            ],
            options={
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Webpage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('webpage_url', models.URLField(help_text='Specify the URL of the web page to summarize. Only the http and https URI schemes are supported.', unique=True, validators=[django.core.validators.URLValidator(schemes=['http', 'https'])], verbose_name='Web Page URL')),
                ('webpage_title', models.TextField(blank=True, help_text='The extracted title of the web page. Leave this blank as it is auto-generated.', verbose_name='Web Page Title')),
                ('webpage_summary', models.TextField(blank=True, help_text='The extracted summary of the web page. Leave this blank as it is auto-generated.', verbose_name='Web Page Summary')),
            ],
            options={
                'ordering': ['id'],
            },
        ),
    ]