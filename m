Return-Path: <ksummit+bounces-423-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 6365C3CFACF
	for <lists@lfdr.de>; Tue, 20 Jul 2021 15:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 369981C0EE2
	for <lists@lfdr.de>; Tue, 20 Jul 2021 13:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E312FB6;
	Tue, 20 Jul 2021 13:38:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3979672
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 13:38:37 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id d9so23918001ioo.2
        for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zmEdSjTSj3JvIjfkT+/opOuIToXXmkfIb/IuD9OFbS4=;
        b=kh81rdzLUfjnmhxMKSObdvUV62rrjKpxk7IppIKkV3sASnip25gwtQHQCpgEoPPjm5
         Ldb31UwYhyRwdKpMiSwuZEMxFVidFKYXe1EXPxnTPximlOeLOOuNmERSUWsn3+Jczny5
         NI3UuYlw/AWRT99rLLdBVpQZxwjVqpRWZyiHok+BE4WJJ58X3bcy3INvTin3CCSGN5LI
         rO5IN2mRu/cW5eieOeKTYRkYGDBLGPT5eb6Ruay9Io+RGnz6PqhkepErWwelNQeV2DSS
         7gHKd6TMZZi/SnBWmx58GihnYLr1sZeBQaI0mId7S9w7BkrS6SWeBhjj5ZY6AcyJ8/U4
         56ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zmEdSjTSj3JvIjfkT+/opOuIToXXmkfIb/IuD9OFbS4=;
        b=Dd/rYiBDBgtFmiiL7kN6lYu/FfgYjdDH+YW3WKRNIFyd5X4vyaklaMzzSV/byRU7S5
         gPHDB0iY69AVKKiOCGqIO+fe08YCT0zDblifSeUqh1SmlIVlfchyJvY+l4K7WjHHM6Ja
         phZew1R6xBOk7F0u26bzpkvJxVXb3sq8tf6W/b5YE6woXL7jnj/U1Lada1Ib6UVtqSNf
         Ktus1RruYqe19sZ8+C2NkaXcOBZievWz1FWaA7xd2kCi/UGTJ28HEGQc/mCn5E5NO2+R
         twxGW/lKNx1QUo/+Oy9bTJJAMmcxmVBBlgh/GmXdjzCMIdH2Ckyk6uZ809C9nBzjyxdh
         pR4Q==
X-Gm-Message-State: AOAM531+uX1ony9+Pb+FqbQnnb1sDGHrI3f7dYsCDqX4ZKfukw5VScYd
	8BvyvqIJ3JXcHVS5Ml6t2RpjUQQHsis9jtufZyk=
X-Google-Smtp-Source: ABdhPJy5SCBoT77oB7PQDUk+MkEaUbA01yoSSbDdZ4qNkwksRKZc27GaJmJvBTUBoZS+PXAHHVDrvznuAB0LR20lXOI=
X-Received: by 2002:a6b:7a04:: with SMTP id h4mr5989911iom.149.1626788316430;
 Tue, 20 Jul 2021 06:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOb/aJC2VuOcz3YY@google.com> <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
 <YPWPbbqdG3aFCmAZ@google.com> <CACRpkdYqfYrhWT2kZ0uy8hS__EfVmQdq8X5ev6Oke+WQWfiDSg@mail.gmail.com>
 <YPYk4gSGJrGvg+M+@google.com> <YPbN3G6qgaeABWEW@lunn.ch>
In-Reply-To: <YPbN3G6qgaeABWEW@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jul 2021 15:38:24 +0200
Message-ID: <CANiq72kJfQZP24EyOe0qdWQ1xF-0wnfa3Nbz0XtiCe6eu9pgog@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Andrew Lunn <andrew@lunn.ch>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 3:21 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Part of the issue here is -stable and back porting fixes. If files
> move around within the tree, it makes this back porting harder. git
> cherry-pick is a lot less likely to work, it needs more manual
> intervention. I expect it will make the stable teams job much easier
> if these files are in the right place from day 1 and never move.

We can definitely move things already if we agree on a particular
approach -- we definitely do not want to make anybody's job harder.

An alternative could be stating that Rust support will not get
backports for e.g. the first two or three releases to give it a bit of
time to mature in-tree; while making it easier to get maintainers
involved and in general everything rolling.

Cheers,
Miguel

