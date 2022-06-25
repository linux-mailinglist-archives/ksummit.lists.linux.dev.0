Return-Path: <ksummit+bounces-718-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CEF55ABE2
	for <lists@lfdr.de>; Sat, 25 Jun 2022 20:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66EFE280C98
	for <lists@lfdr.de>; Sat, 25 Jun 2022 18:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EAF29A3;
	Sat, 25 Jun 2022 18:12:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38905290B
	for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 18:12:00 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id eq6so7605433edb.6
        for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 11:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OBxmCPe1a9gtBWtd2b1q/5OB2yeSPGZIj9MGnPFRNQc=;
        b=Cz4Eh7TKwXzupbbTZnAavi86ao5N5C3UXe1drQk3qZNQtPe6JO16NwJOvyHa6bgQVi
         Wh//+bWAlSHGwjXvCSfJcs91cbGm+tSHUKDFrv7UsgpuptvlAKhV7uYRXpBnvGgmNrEP
         7aJBNImbkhdqdmOA+hsrtDxHDMeReL4rB+zA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OBxmCPe1a9gtBWtd2b1q/5OB2yeSPGZIj9MGnPFRNQc=;
        b=5zPE+QNW+BNObGH9UTFKYjvoZBDw4pe/TGEBNd2uwZkQjVXZTdjg6jzeWcU3n07CtU
         8OxcbSn0AotBgLEcLozyslSk3kHtVGMkM2guYXdQuB5hT2XDIoiADztOg85Ti/VXM+fE
         OYPhjMHcVwd/07vmU3Z8Xxn3WVwcBSRlwlA5rVsJ7Gz/JD3f4J10D+lhPDzQ1OrpI4DY
         4DD9AhSlTG5QnbPOGaehoQTcRNBLwqbq5OYBtH93Y5LEfbCm1NiOGs+DM3CJdAXFirw6
         42BS7RjhenXKjSNN3Q9gqP1skuugilPFt1sMhjeCk8/dKIGjqzkNy6ovEi1mHo9//I+4
         Mkdg==
X-Gm-Message-State: AJIora9P2JmvN+JCeNViixXmsFQcU0JekgKZywlRQSo7eUKisG2ndlkS
	Ow+7Hb8N3jcMaFygqu6RzwACnr1RmfoGBvzK
X-Google-Smtp-Source: AGRyM1sBHJ7mRTsM8zghqvQOBx5Cv1tgRBi8sKWRAwtvfUqQW8CbdXrou8o8qN9fyYjX+A6QHkltxA==
X-Received: by 2002:a05:6402:e07:b0:435:daf0:c8cb with SMTP id h7-20020a0564020e0700b00435daf0c8cbmr6381787edh.396.1656180718281;
        Sat, 25 Jun 2022 11:11:58 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id v19-20020a170906381300b00721d8e5bf0bsm2892775ejc.6.2022.06.25.11.11.56
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 11:11:57 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id s1so7313611wra.9
        for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 11:11:56 -0700 (PDT)
X-Received: by 2002:a5d:64e7:0:b0:21b:ad72:5401 with SMTP id
 g7-20020a5d64e7000000b0021bad725401mr4483822wri.442.1656180716537; Sat, 25
 Jun 2022 11:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
 <875ykrrb45.fsf@intel.com> <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net> <20220624083307.159824bd@sal.lan>
 <87tu891xfv.fsf@meer.lwn.net> <20220625101029.67f14c4c@sal.lan> <87czew267z.fsf@meer.lwn.net>
In-Reply-To: <87czew267z.fsf@meer.lwn.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 25 Jun 2022 11:11:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
Message-ID: <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
	ksummit <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev, 
	Markus Heiser <markus.heiser@darmarit.de>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 25, 2022 at 7:00 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> I said "some" - this was a proof-of-concept hack.  The complexity of
> their symbol lookup code is ... daunting ... and not something that gets
> fixed in one place.  More research is required...

Note that at least for me, the issue with building docs isn't hugely
performance related.

Yes, yes, it would be good if it was faster. But..

The primary problems I see with building the docs (and thus checking
them, the same way I do an allmodconfig build test) is

 (a) it's insanely noisy, which makes and "check that it's ok" ENTIRELY USELESS.

Seriously. There's a very solid reason why I require the standard
kernel build to be entirely warning-free. Warnings are *BAD*. Even a
single false-positive warning invalidates all other warnings.

And the doc build isn't about some "single warning" thing.

 (b) it requires some unusual build tools

Now, (b) may some historical oddity, but at least if you have Fedora
installed and it still has sphinx version 2.2.11 or something like
that.

And when you try to build docs, the makefile gives you some random pip
install thing that is entirely bogus.

The proper fix is to actually remove that old sphinx environment
entirely, and install "python3-sphinx" instead, but that's not at all
what the "to upgrade Sphinx" docs in the kernel say when you try to
make the docs.

Anyway, (b) is one of those "the docs about the docs are wrong" things
and ironic - but easily fixable if you know about it.

But (a) then makes it all entirely pointless as far as I'm concerned.
The doc build could take five seconds, and I *still* wouldn't bother,
because building docs doesn't actually do anything useful for me. It's
just noise.

                  Linus

