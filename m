Return-Path: <ksummit+bounces-155-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93990369523
	for <lists@lfdr.de>; Fri, 23 Apr 2021 16:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 588E81C81CE
	for <lists@lfdr.de>; Fri, 23 Apr 2021 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154CD2FA7;
	Fri, 23 Apr 2021 14:52:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC94A2FA1
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 14:52:44 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id u8so36485442qtq.12
        for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4m20VAT8kYLE53t/32WRX1SK+hDiSOV5LDT1lmRhIfE=;
        b=O/+hhU+hkbu2XkphqrJX2eHshl3WS6AAJrXyxmUvP5y7dlhg016VJvPh5Z804F6SqU
         iT4DUcdxvrI0jCon8E3pJ7rRivMjAgjuPT2/m/khhC32Jm07J6pTdLH3SNy11mFUNSp8
         8Ijw30cFMxTfy5VC3Qqy9EazCSumNNC1qLQBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4m20VAT8kYLE53t/32WRX1SK+hDiSOV5LDT1lmRhIfE=;
        b=AyZAJ5+pYq2ThwG/0lA+I7CO8RQJOjVHVaeBUgamWF2QGuqGoXBbfJz70hAqj3Yc76
         gGdYN5X7xaYPmGdJMYBjJidBToX4ADP+AljTGgwvk832DbLhcgK2MehQSUrUhNlkeb70
         WDoccs2rnl4ZT8t8AKbQ2X2KS7TKEnPJdOUFmtgKatjhOTJ3gcjCfPDZXYmYzsgWAgk7
         0GGWFwjyNp1MFgBpFhU+2J6KyIMhd2IMs7NwfmRa1jnxT657mEshefY2aSkbM57eapH8
         hJNbKhnLmSng48iFNLt4zExd2+6zUCusF7bbmhs/Oa9javWqalaGM5clmy8VHvflBypM
         h7HQ==
X-Gm-Message-State: AOAM531GvXKatScyXYHcuvS3tzTdpZg77RfRdZi2Yy/stv/tnb8fiH6S
	RC2Ie5czKu7VQEA1LABZF5CMpJlPYFxxMQ==
X-Google-Smtp-Source: ABdhPJw1IJ08dmbspzliS0XMqC8yANkemlNwMXTun5x0rCakERbEia3S9dAQm8x/2KnIKEJ7y/tY7Q==
X-Received: by 2002:ac8:1e0f:: with SMTP id n15mr4268451qtl.9.1619189563562;
        Fri, 23 Apr 2021 07:52:43 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id i23sm4501760qtp.61.2021.04.23.07.52.42
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 07:52:42 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id p126so2291223yba.1
        for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 07:52:42 -0700 (PDT)
X-Received: by 2002:a05:6902:4c3:: with SMTP id v3mr6585254ybs.276.1619189561884;
 Fri, 23 Apr 2021 07:52:41 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal> <20210422112001.22c64fe9@coco.lan>
 <YIFfXTVMDmHwVmSR@unreal> <20210422092916.556e5e50@gandalf.local.home>
 <CAL_JsqKS-=shqkLhzKeLHqNPhosGJw5X-fOi+dy1rT3Q_LfBZg@mail.gmail.com>
 <20210423080454.78f4f662@coco.lan> <6c221d801c5a6834168207b5ccadc76ac432c766.camel@perches.com>
 <20210423091320.4f2381b2@coco.lan>
In-Reply-To: <20210423091320.4f2381b2@coco.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Apr 2021 07:52:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xi6TL05M2bYKNgNB-ePY40CvonPzJYeMhXMPGgYKA5_Q@mail.gmail.com>
Message-ID: <CAD=FV=Xi6TL05M2bYKNgNB-ePY40CvonPzJYeMhXMPGgYKA5_Q@mail.gmail.com>
Subject: Better tools for sending patches (was: Re: [MAINTAINER SUMMIT]
 Rethinking the acceptance policy for "trivial" patches)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Joe Perches <joe@perches.com>, Rob Herring <robherring2@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Leon Romanovsky <leon@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	tools@linux.kernel.org, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Apr 23, 2021 at 12:13 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Thu, 22 Apr 2021 23:46:31 -0700
> Joe Perches <joe@perches.com> escreveu:
>
> > On Fri, 2021-04-23 at 08:04 +0200, Mauro Carvalho Chehab wrote:
> > > I have a script to automate it, but I had to tweak it while handling
> > > patches that cross a single subsystem boundaries, using git send-email
> > > with the c/c list obtained from get_maintainers.pl.
> > >
> > > By default, the script adds all maintainers, reviewers and all mailing
> > > lists to the cover letter, but that sometimes generate a cover letter
> > > with 80+ c/c, which will be automatically rejected by anti-spam
> > > measures and by mail servers.
> > >
> > > So, I played with two different alternatives:
> > >
> > > 1. At the beginning, I changed the script to c/c only the mailing lists,
> > >    excluding maintainers/reviewers;
> > > 2. As the feedback was not great, I changed the script to c/c only
> > >    the maintainers, excluding mailing lists/reviewers. It seems that
> > >    this worked better.
> > >
> > > I didn't try to play with bcc, as replying to it would not send
> > > the replies to everyone.
> > >
> > > If you think it is worth, I could submit it to scripts/, but I
> > > suspect we may need to adjust it to work with all maintainers'
> > > workflows.
> >
> > I have a very similar script
> >
> > A portion of a cc script I use tests whether cc'ing the cover letter
> > to all listed maintainers of a patch series creates a header of less
> > than 512 chars and if so cc's all relevant maintainers, otherwise it
> > just cc's the mailing lists.
> >
> > (Ingo didn't/doesn't want to receive any emails from me)
> >
> > $ cat ~/bin/remove_undesirable_emails.sh
> > grep -vPi "(?:\bIngo\s+Molnar\b)"
> >
> > $ cat ~/bin/cc.sh
> > #!/bin/bash
> >
> > opts="--nogit --nogit-fallback --norolestats"
> > maint_file=$(mktemp -t XXXXXXXX.cc)
> >
> > if [[ $(basename $1) =~ ^0000- ]] ; then
> >     ./scripts/get_maintainer.pl $opts $(dirname $1)/* |  \
> >       ~/bin/remove_undesirable_emails.sh > $maint_file
> >     count=$(wc -c $maint_file | cut -f1 -d" ")
> >     if [[ $count -lt 512 ]] ; then
> >       cat $maint_file
> >     else
> >       ./scripts/get_maintainer.pl -nom -nor $opts $(dirname $1)/* | \
> >           ~/bin/remove_undesirable_emails.sh
> >     fi
> >
> > ...
> >
>
> Heh, mine is a lot more complex than that ;-)
>
> It internally runs git format-patch, git send-email and get_maintainers.pl,
> and, when --cover or --annotate is used, it opens a window to allow
> editing the text. It has several options in order to tweak its behavior.

FWIW, I suppose I'll take this opportunity to point out "patman",
which is the tool I use for this. It lives in U-Boot but I (and
several others) also use it for Linux development. See
<https://source.denx.de/u-boot/u-boot/-/blob/master/tools/patman/README>.
I seem to remember at one point Olof criticizing it as making it too
easy to send big patch series (apologies if I remembered this wrong
Olof), which I actually took as a big praise for the tool. ;-)

At the moment, patman does this for Linux:

1. By default calls "get_maintainer" to (separately) add CCs to each
patch in the series. There has been talk about this not being the
default for Linux and by default CCing everyone on all patches (or at
least making an option for it).

2. By default CCs everyone on the cover letter.

3. Neatly handles version history and includes version history both in
the cover letter and each patch.

4. ...and a whole load of other cool things.

I know it's nearly impossible to get people to change their workflows,
but if you're open to it I definitely suggest giving it a try. Simon
Glass (the original author) is also quite receptive to improvements.

-Doug

