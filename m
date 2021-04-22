Return-Path: <ksummit+bounces-63-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3B33680E4
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id E4F741C4DA2
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CA92FA1;
	Thu, 22 Apr 2021 12:54:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39E22F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 12:54:00 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id e13so36250906qkl.6
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sSTTRhadAQGRa1rakPq8a2m25LOdGL6+FBNHT8RwQ6s=;
        b=aJfRr/mrVs24owbcVhdOTmWXVM5G7lGFsm/qtSREGfB6fMdMhNln4SF4eyD7PRwbqz
         6UBeQY9DddaIWdwWDn8XEWAKnq52jbDo9/UDIJez6tDNZSa+WL503pv6mImPy/zXI1Xn
         uWCN3vfxj/zYT6emQsOVKqxYvDQgLLcuSsQu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sSTTRhadAQGRa1rakPq8a2m25LOdGL6+FBNHT8RwQ6s=;
        b=AW9rDPzKy/gvg/mmB+PY8937g8RuOlzwIzzxfKwNG5znOlq28dTXcR9iF7p5dvmKm/
         O90FKAhe735Fhed5clvROFJ/QHMOjNKdF7x4hq+8R74H8MdnDTKOQaymRoIufctE+INz
         v5kh8rBsDi5YQHptfQn9K1vNZM/MLlNcFblf/gT5Evs+InjDJdF1UJRyPixUpG8XI1Ys
         k+R6CArr6zNAy/Z5NBm6EqL+cN5dnMTUPeSPOeco3Nzfmdf/TXsMt/SEBAyGVEVi/Pcw
         YiP6+HpyJfuypujpXQOZ7Q1PHWPZDT+mm2FRR3Hm6KHHuKunOt61liN+7vu4M6mro6Bm
         M2iA==
X-Gm-Message-State: AOAM5332P5UVhR9FnLaOqtS3Ua3zUCdBEWo9ZEOGO07xKTdAYVZPkzsQ
	09HaTWL+qlokd9irqtr63cgEi+XlslQzv8ov
X-Google-Smtp-Source: ABdhPJwLWTzhfzoK3uFyN6F8EcgugWIoL1DR3o9vBUviGz4fHoMpNU5pxjmZtW+FlMVimm+UfSDsuw==
X-Received: by 2002:a37:89c7:: with SMTP id l190mr3676574qkd.361.1619096039572;
        Thu, 22 Apr 2021 05:53:59 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id i127sm2076460qke.71.2021.04.22.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 05:53:59 -0700 (PDT)
Date: Thu, 22 Apr 2021 08:53:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422125357.uuxprp6rqxewcdsr@nitro.local>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210422112001.22c64fe9@coco.lan>

On Thu, Apr 22, 2021 at 11:20:01AM +0200, Mauro Carvalho Chehab wrote:
> Also, nowadays, with lore and b4, it would be easy to retrieve the
> entire patch series, even for those that aren't subscribed on a 
> c/c mailing list.

If you're a mutt user, you can set up a keybinding, e.g.:

    macro index 4 "<pipe-message>~/work/git/korg/b4/b4.sh mbox -f -o ~/Mail<return>"

You'll need to adjust it to point at where your maildir lives, of course, but
that's the general idea. With it in place, you can hit "4" in the index view
to get the rest of the thread (without duplicating the messages you already
have).

If you use mbsync, this will also put the thread into your remote imap folder.

-K

