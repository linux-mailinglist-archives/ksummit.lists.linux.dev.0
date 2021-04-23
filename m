Return-Path: <ksummit+bounces-160-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 3081B369A66
	for <lists@lfdr.de>; Fri, 23 Apr 2021 20:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 520733EA6BB
	for <lists@lfdr.de>; Fri, 23 Apr 2021 18:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745BE2FA9;
	Fri, 23 Apr 2021 18:50:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFA472
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 18:50:51 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id 66so11044788qkf.2
        for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 11:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W8M3IOcLzcWvugIRUlf9I0itfXsnDfKznr5TIA7ld38=;
        b=JfUeh2KSHFjho4joQh+XOGNBGnblJ7/uHMI+Mc+YDumNddPCDYR6lOnYa0m/Snqm8e
         Px+k4qGbyHP2nK1IJzFfqPWdNCztWreIb9HfzDZHqmxffzfGA9Oa6SB6uZPhBx9nbt0p
         6PuzwZ9pXJBjNfczc1BPsNqJXovskxgExSTpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W8M3IOcLzcWvugIRUlf9I0itfXsnDfKznr5TIA7ld38=;
        b=n/Fr4rIpQi2VFPCJ8QRVkj5ia/1t1dwU58rN/Xwunjj+59xpK1KjLAtf6FioU6keTT
         WpvzQ0DWyknS7AjTYIgOd2N945M62BfbIVACMKxByYMM3Rhnz0xbO4dOYLxOifnvaUzz
         L9f6nVU8sjNkP02nDbu4rPyui5yHdiJfe9cliSKOJUaWqltCl2wwm2+/e+bMeewIq+QQ
         Ym1Zb0+ZrMtgK+SQX/6pNxF/eyXRPNJ6HMqUwozPNu/1MnN0V+VqBtcqXMV3QmJK9OtX
         1t55X9KEWuNNPu9+uPu/gzM0i2Ce0h8A+/F50JPK7myEFO9Bl7Zp7fTJeQzrqlmdDxqM
         03sA==
X-Gm-Message-State: AOAM533t/cbB7QdaLd5EBrEOi/7qETevJ1viU4G20hizrsW4TGzbgVmN
	FAb0HRk9f8S9p/E6tXx5j7xp9A==
X-Google-Smtp-Source: ABdhPJxijHCcnOch3UGUO8WkS4T38Y6glMUGGYB3+KwaeYxkwjkYMkEdYLvmo/mgxIKPnfsBvnerbQ==
X-Received: by 2002:a37:bb42:: with SMTP id l63mr5572256qkf.127.1619203850250;
        Fri, 23 Apr 2021 11:50:50 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id d3sm4903828qtm.56.2021.04.23.11.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 11:50:49 -0700 (PDT)
Date: Fri, 23 Apr 2021 14:50:47 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210423185047.jlmzk75utekj2ijw@nitro.local>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <20210422125357.uuxprp6rqxewcdsr@nitro.local>
 <20210423073120.2xm3prdjllpqdhgi@wittgenstein>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210423073120.2xm3prdjllpqdhgi@wittgenstein>

On Fri, Apr 23, 2021 at 09:31:20AM +0200, Christian Brauner wrote:
> > If you're a mutt user, you can set up a keybinding, e.g.:
> > 
> >     macro index 4 "<pipe-message>~/work/git/korg/b4/b4.sh mbox -f -o ~/Mail<return>"
> > 
> > You'll need to adjust it to point at where your maildir lives, of course, but
> > that's the general idea. With it in place, you can hit "4" in the index view
> > to get the rest of the thread (without duplicating the messages you already
> > have).
> 
> I do currently have three keybindings:
> 
> macro index,pager A "<pipe-message>b4 am -t -l -s -g -c -C -Q <enter>"
> macro index,pager S "<pipe-message>b4 am -t -c -Q <enter>"
> macro index,pager M "<pipe-message>b4 mbox <enter>"
> 
> The -f switch is new, right?

Relatively so, yes. Note, that it shouldn't be used on huge inboxes, as it
will have to go through each message in the maildir to collect message-ids
that are already present.

-K

