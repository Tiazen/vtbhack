# Generated by Django 3.2.8 on 2021-10-08 17:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0004_appuser_age'),
    ]

    operations = [
        migrations.CreateModel(
            name='Game',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gameType', models.IntegerField(default=0)),
                ('created_at', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='PlayerGames',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('game', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.game')),
                ('player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.appuser')),
            ],
        ),
    ]
