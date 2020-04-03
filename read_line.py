import json,sys

ins = '''
INSERT INTO `t_user` (`openid`, `nick_name`, `show_name`, `auth_name`, `auth_code`, `avatar_url`, `level`, `status`, `gender`, `c_date`, `latest_date`, `coin_date`, `heart_date`) VALUES
'''

fin = r'E:\omo.sql\user.json'
fout = r'E:\omo.sql\user.sql'

def initUser():
    with open(fout, 'w', encoding='utf-8') as out:
        with open(fin, 'r', encoding='utf-8') as inf:
            ols = [ins]
            for line in inf:
                line = line.replace('\'','\'\'').strip()
                if not line: continue
                jd = json.loads(line)
                openid = jd.get('openid', '')
                nick_name = jd.get('nick_name', '')
                show_name = jd.get('show_name', '')
                auth_name = jd.get('auth_name', '')
                auth_code = jd.get('auth_code', '')
                avatar_url = jd.get('avatar_url', '')
                level = jd.get('level', '')
                status = jd.get('status', '')
                gender = jd.get('gender', '')
                c_date = jd.get('c_date', '').get('$date').replace('T',' ').replace('Z','')
                latest_date = jd.get('latest_date', '').get('$date').replace('T',' ').replace('Z','')
                coin_date = jd.get('coin_date', '').get('$date').replace('T',' ').replace('Z','')
                heart_date = jd.get('heart_date', '').get('$date').replace('T',' ').replace('Z','')
                ol = "('%s', '%s', '%s', '%s', '%s', '%s',%s, %s,%s, '%s','%s', '%s','%s'),\n" % (openid, nick_name, show_name, auth_name, auth_code, avatar_url, level, status, gender, c_date, latest_date, coin_date, heart_date)
                ols.append(ol)
            ols[-1] = ols[-1].strip().strip(',') + ';'
            print(len(ols), fout)
            out.writelines(ols)
initUser()


ins = '''
INSERT INTO `t_list` (`file_id`, `src_video`, `video_size`, `title`, `serifu`, `koner`, `roma`, `src_image`, `status`, `level`, `clicks`, `stars`, `cate`, `c_date`) VALUES
'''
fin = r'E:\omo.sql\list.json'
fout = r'E:\omo.sql\list.sql'

def initList():
    with open(fout, 'w', encoding='utf-8') as out:
        with open(fin, 'r', encoding='utf-8') as inf:
            ols = [ins]
            for line in inf:
                line = line.replace('\'','\'\'').strip()
                if not line: continue
                jd = json.loads(line)
                file_id = jd.get('file_id', '')
                src_video = jd.get('src_video', '')
                video_size = jd.get('video_size', '')
                title = jd.get('title', '')
                serifu = jd.get('serifu', '')
                koner = jd.get('koner', '')
                roma = jd.get('roma', '')
                src_image = jd.get('src_image', '')
                status = jd.get('status', '')
                level = jd.get('level', '')
                clicks = jd.get('clicks', '')
                stars = jd.get('stars', '')
                cate = jd.get('cate', '')
                c_date = jd.get('c_date', '').get('$date').replace('T',' ').replace('Z','')

                # 字段格式
                ol = "('%s', '%s', %s, '%s', '%s', '%s','%s', '%s',%s, '%s',%s, %s,'%s','%s'),\n" % (file_id, src_video, video_size, title, serifu, koner, roma, src_image, status, level, clicks, stars, cate, c_date)
                ols.append(ol)
            ols[-1] = ols[-1].strip().strip(',') + ';'
            print(len(ols), fout)
            out.writelines(ols)
initList()

ins = '''
INSERT INTO `t_record` (`record_id`, `file_id`, `src_record`, `master_id`, `heart`, `comm`, `status`, `c_date`) VALUES
'''
fin = r'E:\omo.sql\record.json'
fout = r'E:\omo.sql\record.sql'

def initRecord():
    with open(fout, 'w', encoding='utf-8') as out:
        with open(fin, 'r', encoding='utf-8') as inf:
            ols = [ins]
            for line in inf:
                line = line.replace('\'','\'\'').strip()
                if not line: continue
                jd = json.loads(line)
                record_id = jd.get('record_id', '')
                file_id = jd.get('file_id', '')
                src_record = jd.get('src_record', '')
                master_id = jd.get('master_id', '')
                heart = jd.get('heart', 0)
                comm = jd.get('comm', 0)
                status = jd.get('status', 0)
                c_date = jd.get('c_date', '').get('$date').replace('T',' ').replace('Z','')

                # 字段格式
                ol = "('%s', '%s', '%s', '%s', %s, %s,%s, '%s'),\n" % (record_id, file_id, src_record, master_id, heart, comm, status, c_date)
                ols.append(ol)
            ols[-1] = ols[-1].strip().strip(',') + ';'
            print(len(ols), fout)
            out.writelines(ols)
initRecord()

ins = '''
INSERT INTO `t_audio` (`file_id`, `src_audio`, `c_name`, `s_name`, `level`, `shadow`, `cate`, `ski`, `ver`, `status`, `c_date`) VALUES
'''
fin = r'E:\omo.sql\audio.json'
fout = r'E:\omo.sql\audio.sql'

def initAudio():
    with open(fout, 'w', encoding='utf-8') as out:
        with open(fin, 'r', encoding='utf-8') as inf:
            ols = [ins]
            for line in inf:
                line = line.replace('\'','\'\'').strip()
                if not line: continue
                jd = json.loads(line)
                file_id = jd.get('file_id', '')
                src_audio = jd.get('src_audio', '')
                c_name = jd.get('c_name', '')
                s_name = jd.get('s_name', '')
                level = jd.get('level', '')
                shadow = jd.get('shadow', '')
                cate = jd.get('cate', '')
                ski = jd.get('ski', '')
                ver = jd.get('ver', '')
                status = jd.get('status', 1)
                c_date = jd.get('c_date', '').get('$date').replace('T',' ').replace('Z','')

                # 字段格式
                ol = "('%s', '%s', '%s', '%s', '%s', '%s','%s', '%s',%s, %s,'%s'),\n" % (file_id, src_audio, c_name, s_name, level, shadow, cate, ski, ver, status, c_date)
                ols.append(ol)
            ols[-1] = ols[-1].strip().strip(',') + ';'
            print(len(ols), fout)
            out.writelines(ols)
initAudio()

ins = '''
INSERT INTO `t_link_rank` (`openid`, `point`, `puz`, `coin`, `check_coin`, `total_coin`, `round`, `hira`, `kata`, `space`, `myco`, `ran`, `status`, `s_date`, `latest`, `c_date`) VALUES
'''
fin = r'E:\omo.sql\link_rank.json'
fout = r'E:\omo.sql\link_rank.sql'

def initRank():
    with open(fout, 'w', encoding='utf-8') as out:
        with open(fin, 'r', encoding='utf-8') as inf:
            ols = [ins]
            for line in inf:
                line = line.replace('\'','\'\'').strip()
                if not line: continue
                jd = json.loads(line)
                openid = jd.get('openid', '')
                point = jd.get('point', '')
                puz = jd.get('puz', '')
                coin = jd.get('coin', '')
                check_coin = jd.get('check_coin', '')
                total_coin = jd.get('total_coin', '')
                round = jd.get('round', '')
                hira = jd.get('hira', '')
                kata = jd.get('kata', '')
                space = jd.get('space', '')
                myco = jd.get('myco', '')
                ran = jd.get('ran', '')
                status = jd.get('status', 1)
                s_date = jd.get('s_date', '').get('$date').replace('T',' ').replace('Z','')
                latest = jd.get('latest', '').get('$date').replace('T',' ').replace('Z','')
                c_date = jd.get('c_date', '').get('$date').replace('T',' ').replace('Z','')
                # 字段格式
                ol = "('%s',%s,'%s', %s,%s,%s, %s,'%s','%s', '%s','%s',%s, %s,'%s','%s', '%s'),\n" % (openid, point, puz, coin, check_coin, total_coin, round, hira, kata, space, myco, ran, status, s_date, latest, c_date)
                ols.append(ol)
            ols[-1] = ols[-1].strip().strip(',') + ';'
            print(len(ols), fout)
            out.writelines(ols)
initRank()

ins = '''
INSERT INTO `t_comment` (`id`, `record_id`, `user_id`, `file_id`, `master_id`, `status`, `content`, `stars`, `re_id`, `re_name`, `re_content`, `c_date`) VALUES
'''
fin = r'E:\omo.sql\comment.json'
fout = r'E:\omo.sql\comment.sql'

def initComm():
    with open(fout, 'w', encoding='utf-8') as out:
        with open(fin, 'r', encoding='utf-8') as inf:
            ols = [ins]
            for line in inf:
                line = line.replace('\'','\'\'').strip()
                if not line: continue
                jd = json.loads(line)
                id = jd.get('id', '')
                record_id = jd.get('record_id', '')
                user_id = jd.get('user_id', '')
                file_id = jd.get('file_id', '')
                master_id = jd.get('master_id', '')
                status = jd.get('status', 1)
                content = jd.get('content', '')
                stars = jd.get('stars', 0)
                re_id = jd.get('re_id', '')
                re_name = jd.get('re_name', '')
                re_content = jd.get('re_content', '')
                c_date = jd.get('c_date', '').get('$date').replace('T',' ').replace('Z','')

                # 字段格式
                ol = "('%s', '%s', '%s', '%s', '%s', %s, '%s',%s, '%s','%s', '%s','%s'),\n" % (id, record_id, user_id, file_id, master_id, status, content, stars, re_id, re_name, re_content, c_date)
                ols.append(ol)
            ols[-1] = ols[-1].strip().strip(',') + ';'
            print(len(ols), fout)
            out.writelines(ols)
initComm()