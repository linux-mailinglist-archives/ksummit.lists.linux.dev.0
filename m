Return-Path: <ksummit+bounces-1296-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF7E909CB3
	for <lists@lfdr.de>; Sun, 16 Jun 2024 11:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A89731F213B3
	for <lists@lfdr.de>; Sun, 16 Jun 2024 09:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE59A17E464;
	Sun, 16 Jun 2024 09:05:29 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367568F54
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718528729; cv=none; b=Sy51edqaSGcKxBDjmfjdoJUfQNVaJ6+C83VlJrfOYZ3F65U3masJc5Bk/bauv1JAbQhjyooNQVwm4zXmTIVEMreIPdzFtUeforF/nyqC704bWD+xz0hn19VX62MCxAxDjbQWmBaPUHL6izszvV0wqJSZpg/+ZphDzDhZFeGAaZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718528729; c=relaxed/simple;
	bh=ZuOFaMoyYkfer3w7bx1G8iKmj9HU4iD/1l68yAZsA/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GaHS5GZXfZVmgNIN/uqV6tizYdzR2+gZyLauItlVWAgTE6qUMSNAZ3vh5/o6RojRLpui2zUX5DCXAvbaaOzNDGkmNgfQL1cps2QMEzVef1AFPV6u722PFsd190gJg7PtWipo9QVhru7h7w2zpgzof1x+CsgenjOIDgDC0K6oQ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfa48f505dfso3641308276.3
        for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 02:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718528725; x=1719133525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2Rgo2TbzScywqDONbV3m3gUrxfVPM9tRHW9PCeKy3U=;
        b=cojgCv1f/Sq0XeXooy11AIye1oeCMpgVRtE0UZ05miZh9NgieLqxaB3aMAClK6VEjl
         bQ3AM1gby/8Zq1wjrAFviWFSZVtKZDrhl1qMGrOPy2RkF5tZUoVY6YTJdDNpmYDNtALv
         0FxFx9JPHkv4hRh4YFbrueX5LBL9c9QjscehSl6RNhneL/oghC4U9UIk+V4mFXD/a+ty
         tTNAGrnFMhaeljKFt1TQfar+ytibDWUmJPMbGU42oiweQRvAp4r46MD0Yduy/kV2w0Hp
         KEPMpdFjv3XSKY/r+aivLDAHhvo/l76DPofnoUWhJgRxn9nW/Bb7cm4u+qgIRrDBGdma
         1WXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7xSkZWxRX10GMZ7b8744LL0twMkMb7wtnjZ5oqe3BsmhnKIe5MD8FljNCcb636war3XfqI/SRd+S1RoaIJXiHCzNwdq3AVg==
X-Gm-Message-State: AOJu0Yykt7HT9DA+hk0LvZyPjgwg7zZUkC66SYxRSn/jREc7oCBDTA5d
	oTFj7prTDKgUOFfkeX6CGuyi4TI7sCBGUn0EYFE4T5aeYLhOZYPWPgd8fexx
X-Google-Smtp-Source: AGHT+IEkTADE3Ln48E/npFLnOjTDRL3BUQ7RHK5DM6bGpg4xB2/FxDLovWUv9kwQUaF+VaEU+KX5IA==
X-Received: by 2002:a25:ac1e:0:b0:dfb:814:1c4 with SMTP id 3f1490d57ef6-dff1547b271mr6297065276.51.1718528725065;
        Sun, 16 Jun 2024 02:05:25 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff04a8b23esm1339497276.54.2024.06.16.02.05.24
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 02:05:24 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfef7b13c98so3779726276.0
        for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 02:05:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVQ/PFg+gSXk6zqCMJfn4+Pzz18X81kA70UBhrIVT3oa0stbqIXujOkcZiRCn/6WJQmkzCtzhB8sOgbaN31gOY1cbsMdLB2A==
X-Received: by 2002:a25:8746:0:b0:dfb:24e4:cee3 with SMTP id
 3f1490d57ef6-dff153aa3c6mr6439115276.24.1718528723954; Sun, 16 Jun 2024
 02:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info> <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <20240615232831.6c7f27dd@gandalf.local.home> <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
In-Reply-To: <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 16 Jun 2024 11:05:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5rXx-ar9MPhcj0UMyAPh=AOQh6oP_2oTRb+qo3txNPQ@mail.gmail.com>
Message-ID: <CAMuHMdV5rXx-ar9MPhcj0UMyAPh=AOQh6oP_2oTRb+qo3txNPQ@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Takashi Iwai <tiwai@suse.de>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jan Kara <jack@suse.cz>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sun, Jun 16, 2024 at 7:00=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> So a pure source link I still find to be of *very* questionable value,
> compared to things that have actual obvious real value:
>
>  - bug reports
>
>  - background discussion
>
>  - pointers to earlier versions that didn't get committed
>
> so yes, I find it almost offensive when I have to debug a problem, and
> I find a Link: that I hope explains things, and all it just shows is
> the SAME DAMN INFORMATION that was in the commit already, and that I
> could trivially have found by just searching lore for the author and
> date.
>
> At that point, "Link:" is just wasting my time.

Searching lore for the author and date manually would have wasted more
time ;-)

The nice thing about the Link to the original patch is that it also
serves as a link to information that did not exist yet at the time the
patch was committed. I regularly run into an issue, bisect the problem,
follow the link, to find a similar bug report and sometimes even a fix.

I agree the perfect patch series would have in the cover letter:
  1. A link to a discussion that started the development op the series,
     and/or earlier tries to solve the itch,
  2. A link to the previously submitted version.
All of these can be found by recursively following the Link in the
commit.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

