Return-Path: <ksummit+bounces-368-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34AF3C220A
	for <lists@lfdr.de>; Fri,  9 Jul 2021 12:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id AEA041C0F27
	for <lists@lfdr.de>; Fri,  9 Jul 2021 10:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241A22F80;
	Fri,  9 Jul 2021 10:02:35 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E532C168
	for <ksummit@lists.linux.dev>; Fri,  9 Jul 2021 10:02:33 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id k4so5086687wrc.8
        for <ksummit@lists.linux.dev>; Fri, 09 Jul 2021 03:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pMpdjHLOcFTwAYrNYMAV3UZbyINNRc9Ym5LX3jQiX7o=;
        b=aADWTyMAEm9ko2w6Z2B0cHVLoitEzLkHNI0vhcbNbZuYxKrBjehaGju9eEazVHID8q
         5tQAXrVE1E7LrIgdCXFfjsmAaTACA+QOAwl+cpUKoOlhFblXYDwKSZUma4ezSjsTo54S
         qI9t55qZc9CWD91Nnz+/ahZdm8cDdxp7eFXMdT7qaxq3niAzuETmCjkkab9GNKPowwBA
         i/t2+PlfQwqFgUdSnN/O85f57aYULPQcwGjR+CiUO68hQ3R8P0CouKjd84kwMzeyx1zv
         UaY4C5ZZj+zVTbms4G9tLVk1aWGH0I+W1R+yxM1rYHl52BVOsoePW8iZkSjbbMi2wL31
         zSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pMpdjHLOcFTwAYrNYMAV3UZbyINNRc9Ym5LX3jQiX7o=;
        b=Vp1yJmOeI9EfkSveXH5Y3Srfq0v8mhHxDjB6eBvJw2+Iw7GwcOWxQeM72jx14gB/w1
         L2u1TbOT4HDfhOML2TrQj24d0z6RJIP9edz6qJa0g99Sdq/lXvzC4IDd57dIUwyb6Ih7
         JIyTxe97EVHwYnXaxfL7DwakIpxteoMxfEF7m8JKuVfnZhHnQj4nP+P+ruOb05d1u8lK
         r7EdoSJcOHp83RmAulyqbPowaOvcW20Fupz7FD9+987CV37OFZTVio1MYSrEgXAbrP3x
         L8JiEJOy7FDJvnDLV9l8C5On6XJ+OLJRxxekGFbURQr1DnCmU6wBFCblKuGzQ4VydUdG
         fXBw==
X-Gm-Message-State: AOAM531CguqnvZd1iXv2/P6016Ti6F7zvLjequ8VLf+BxPHuwyJnJ2cy
	2zEwDPVUAw8OC2Cxjr0br31s7w==
X-Google-Smtp-Source: ABdhPJxAmOJs+uxEXwn6DlroBn0emCenwLGwjVq+d4CqxGHhQelOK9B1ktdb79/O97Jb8GqOgchOlw==
X-Received: by 2002:a05:6000:551:: with SMTP id b17mr39732334wrf.32.1625824952017;
        Fri, 09 Jul 2021 03:02:32 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:8f0a:b44a:3744:8a04])
        by smtp.gmail.com with ESMTPSA id x4sm11724356wmi.22.2021.07.09.03.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 03:02:31 -0700 (PDT)
Date: Fri, 9 Jul 2021 12:02:26 +0200
From: Marco Elver <elver@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev,
	kasan-dev@googlegroups.com
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOgesjNqpsZNK5Gf@elver.google.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <19e0f737a3e58ed32758fb4758393c197437e8de.camel@HansenPartnership.com>
 <CANiq72mPMa9CwprrkL7QsEChQPMNtC61kJgaM4Rx0EyuQmvs2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mPMa9CwprrkL7QsEChQPMNtC61kJgaM4Rx0EyuQmvs2g@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)

On Tue, Jul 06, 2021 at 04:55PM +0200, Miguel Ojeda wrote:
> On Tue, Jul 6, 2021 at 12:20 PM James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> >
> > The main advantage is supposed to be "memory safety":
> >
> > https://en.wikipedia.org/wiki/Memory_safety
[...]
> > The other thing that makes comparison with C hard is the fact that
> > compilers and fuzzers are pretty good at detecting memory problems in
> > the existing code, so it's unclear what memory safety ab initio
> > actually buys for the kernel.
> 
> Compilers definitely do not detect all memory safety issues -- not
> even close. They cannot anyway, in the general case. Not even in C++
> with `std::unique_ptr`, `std::vector`, etc. Rust can do so because it
> places extra restrictions in the modeling capabilities (in the safe
> subset only).

I think the main point was about the combination of sanitizers paired
with fuzzers like syzkaller.

> Runtime detection of UB in C is, of course, possible, but the idea is
> to have static guarantees vs. runtime-checked ones. There is also
> runtime detection of UB in Rust for unsafe code with tooling like
> Miri. plus all the language-independent tooling, of course.

I sincerely hope that not too much trust will be put into Rust-only
dynamic analysis via something like Miri (for the unsafe parts). For the
kernel, first and foremost, the Rust integration will require proper
integration with existing sanitizers (with `rustc -Zsanitizer=`??):
KASAN, KCSAN (possibly KMSAN which is still out-of-tree).

We have years of experience with kernel dynamic analysis, and discover
over and over that bugs are missed due to uninstrumented code paths
(including inline asm and such), and put in a lot of effort to
instrument as much as possible.

It is very likely that if the Rust portion is analyzed alone, be it
statically or dynamically, that there will remain undiscovered bugs due
to improper abstractions between C and Rust. While I fully see that
Rust's static guarantees are strong for safe code, I'm pragmatic and
just do not believe those building the safe abstractions from unsafe
code will not make mistakes nor will those abstractions shield from
changed behaviour on the C side that directly affects safety of the Rust
abstraction.

Not only will Rust integration with K*SANs be required to catch early
bugs in the abstractions, but also be necessary to catch e.g.
use-after-frees in Rust code where C code freed the memory erroneously,
or data races between Rust and C code.

But it will ultimately also prove that the main proposition of Rust in
the kernel holds: less bugs in the Rust parts over time.

