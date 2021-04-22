Return-Path: <ksummit+bounces-119-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id F077F36865B
	for <lists@lfdr.de>; Thu, 22 Apr 2021 20:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 639293E872A
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BAF32FA2;
	Thu, 22 Apr 2021 18:05:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5FB2F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 18:05:42 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id dp18so17849269qvb.5
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=QJDOBjZNcSven3UTiO3Dc5WzgbCZwZstoEMUJuz7pEc=;
        b=QCKWjt290LJn6WWKHFFBpj7mDsqX8y+Kfnp9VpZdqZQ+ll/C8kNROzBOgOSm8ZyRLf
         FN0TRyQonvlhUMQtZnwU/ym2INx8OuluJNZnwCkb1/xAfwXeEpjcNmc0oA0PRpz3gnCu
         AEHxUQmThIvr1xWxu5NZOW1lc3VVSdVEqspVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=QJDOBjZNcSven3UTiO3Dc5WzgbCZwZstoEMUJuz7pEc=;
        b=dLcPoQuiICXkTX5HtlM/c9mSaxYCahP9EEQwB0XeGlyCh1M9Ecxq7ik1IUJbgPy7TE
         UBpUfJKk8unw3wXEq6lnSZ+GZccf8q1caJbEEYIS3+nce/0HXkHXktAYgithb5H3/O64
         xKIdQEOAsR6G754dcOKSGQPFNM2sUAUIPPkT6e56uyzdjIyn+k3UqzE6nKdUTHqKU5DC
         LSUr1QUJJuvECSUQqrKrRrhEcZHyU/waJlkKrVgYv1RSvAWiwKwGaYQgaDM1OVO2DuGX
         +YpIDKpZEP3DJRfm6z+1R4u8U8sdUcV62nncJBhQGICMYqZyozetR6+Fspor5No0HNOm
         H16A==
X-Gm-Message-State: AOAM5327Udmv/38owKLp9Q1RkpJxOB2jJmQUYRpPydHNsd3COQsnn/vB
	6Ln9p1cMc2aBvhozH8qPpUVQwQ==
X-Google-Smtp-Source: ABdhPJwGTDPm6CYqUA0TR0TQONn2UBgV98xUjVWKqrdajzNiND3Aq/reWeD6/pOu5K95R40GJC0l3A==
X-Received: by 2002:a0c:9b88:: with SMTP id o8mr4760246qve.28.1619114741811;
        Thu, 22 Apr 2021 11:05:41 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id a21sm2712214qkk.45.2021.04.22.11.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 11:05:41 -0700 (PDT)
Date: Thu, 22 Apr 2021 14:05:40 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: ksummit@lists.linux.dev, tools@linux.kernel.org
Subject: backfilling threads with b4 (was: Re: [MAINTAINER SUMMIT] Rethinking
 the acceptance policy for "trivial" patches)
Message-ID: <20210422180540.hj6xs75sqlmnegs6@nitro.local>
Mail-Followup-To: Leon Romanovsky <leon@kernel.org>,
	ksummit@lists.linux.dev, tools@linux.kernel.org
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <20210422125357.uuxprp6rqxewcdsr@nitro.local>
 <YIG43TuqmxU24evq@unreal>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YIG43TuqmxU24evq@unreal>

On Thu, Apr 22, 2021 at 08:56:45PM +0300, Leon Romanovsky wrote:
> >     macro index 4 "<pipe-message>~/work/git/korg/b4/b4.sh mbox -f -o ~/Mail<return>"
> > 
> > You'll need to adjust it to point at where your maildir lives, of course, but
> > that's the general idea. With it in place, you can hit "4" in the index view
> > to get the rest of the thread (without duplicating the messages you already
> > have).
> 
> Konstantin,
> 
> I tried the above and here the obstacles which I encounter.

This is probably better suited for tools@linux.kernel.org (cc'ing
accordingly).

> 1. My emails are stored in Maildir. The mb2md script half-worked but ok
> for the test.
> 2. b4 didn't work if I tried to use lore link from the middle of discussion,
> which is very common pattern to me.
> 3. b4 didn't grab the discussions, so I got the patches, but didn't get and
> won't get any interesting to me responses.

Are you sure you copied the command correctly? 

1. It should automatically recognize when it's pointed at a maildir, so no
   mb2md should be necessary. Are you sure you changed "-o ~/Mail" to be
   pointing at your maildir?
2. It's supposed to grab the message-id from the piped message, so you
   shouldn't need to pass any lore links.
3. Are you sure you're using "b4 mbox" not "b4 am"? The mbox command just
   returns the entire thread.

Please feel free to drop ksummit and others on your reply.

-K

