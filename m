Return-Path: <ksummit+bounces-732-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E419F55BB3B
	for <lists@lfdr.de>; Mon, 27 Jun 2022 19:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 757B02E0A87
	for <lists@lfdr.de>; Mon, 27 Jun 2022 17:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1693D71;
	Mon, 27 Jun 2022 17:08:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0494A04
	for <ksummit@lists.linux.dev>; Mon, 27 Jun 2022 17:08:02 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id q6so20431225eji.13
        for <ksummit@lists.linux.dev>; Mon, 27 Jun 2022 10:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uislP0Opcxt4TwIbUM4d3BQqW/0WOX2hRXHOwoDu6Zk=;
        b=HUFCtlWROTkw9muBQikI5ZsErGm2vK9w50p1RTuzajYLmx6OWAuPsxBXL6rm0sTyev
         +Gl9S7zyqFK+pP+fxdlvNuxtZMyTAsqwwp/3mRv5h4wqEyQTUYiejS0FP8CoZ/BiZqP9
         +iF1hWcgInujZiTRbv5EkC8JXWOhnpCZxv0Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uislP0Opcxt4TwIbUM4d3BQqW/0WOX2hRXHOwoDu6Zk=;
        b=oAdN4zNY8LFgkraI+2bbfW13BF5fP6dESfIVsyAHYyFm3jhSezzjj5LMV3MH9YUiXE
         MnpWrj14xIPmhaJlm1LRj7mgVHnagMpnD7TCp+WH42bd7IiujZGbriMiikU+Q42dTcp1
         YXRn4vp5vknbaEf5goxPE4B8gPggLu0zRfMNoSPLFb3OE4dElxbRoogNyXtOXizwf1dF
         s/jsSmEFoHLaOmAeeCEtiAPAKxUDVRVhwUXdvle/7FQxTJvKVY9KZUJONiqC0oBxvNpJ
         Amb+9uEEURiswQT9ik6b2lUiy5oLMiOqMD7khJzSJdi3t5Yr6P5VuSjnSlioi6zzipcC
         h/ew==
X-Gm-Message-State: AJIora999zr7i/2nhxQxRmU7LJOWeQl5f84+ju4Xxc6xRK8GSI31eskv
	Yy5VGoonIQF8dHJIYVOgVAegwmCiMZ0JeU4I
X-Google-Smtp-Source: AGRyM1ur4rEOe/uLI+7uXtMgdyVXtv2EMeq0Cd0jp8zouVO+xuyk5nok0qIQ0/jftwPZOAOBXA6m6w==
X-Received: by 2002:a17:906:7955:b0:726:a858:5a75 with SMTP id l21-20020a170906795500b00726a8585a75mr4754202ejo.764.1656349680381;
        Mon, 27 Jun 2022 10:08:00 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id b20-20020a0564021f1400b0042e15364d14sm7941643edb.8.2022.06.27.10.07.56
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 10:07:57 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id r20so14015391wra.1
        for <ksummit@lists.linux.dev>; Mon, 27 Jun 2022 10:07:56 -0700 (PDT)
X-Received: by 2002:a5d:64e7:0:b0:21b:ad72:5401 with SMTP id
 g7-20020a5d64e7000000b0021bad725401mr12662500wri.442.1656349676430; Mon, 27
 Jun 2022 10:07:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
 <875ykrrb45.fsf@intel.com> <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net> <20220624083307.159824bd@sal.lan>
 <87tu891xfv.fsf@meer.lwn.net> <20220625101029.67f14c4c@sal.lan>
 <87czew267z.fsf@meer.lwn.net> <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
 <87bkueyvbo.fsf@meer.lwn.net>
In-Reply-To: <87bkueyvbo.fsf@meer.lwn.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Jun 2022 10:07:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjYBONGGhiQu2iTP6zWu8y2a4=ii4byoomf6N77-pJNeA@mail.gmail.com>
Message-ID: <CAHk-=wjYBONGGhiQu2iTP6zWu8y2a4=ii4byoomf6N77-pJNeA@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
	ksummit <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev, 
	Markus Heiser <markus.heiser@darmarit.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 27, 2022 at 8:34 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> >  (b) it requires some unusual build tools
> >
> > Now, (b) may some historical oddity, but at least if you have Fedora
> > installed and it still has sphinx version 2.2.11 or something like
> > that.
> >
> > And when you try to build docs, the makefile gives you some random pip
> > install thing that is entirely bogus.
>
> I'd be curious to know about how you got into that situation.  Fedora
> handles this stuff pretty readily.  I'll take another look at what we
> have there.

At some point I just did "dnf install sphinx", and it got me a sphinx install.

So then the kernel doc build system sees "oh, you need a newer version
of sphinx" or whatever, and suggests you do that horrible virtual
python sandbox thing and do a random pip install in that, which I
really don't want to do.

So I ignore it entirely, obviously.

End result: it took me a *loong* time to go "I wonder why modern
Fedora ships with an ancient version of sphinx, since the modern
version is apparently 4.x something".

And only at THAT point do you realize that there are three completely
different projects called "sphinx".

There's the docbuild one that comes from python, which is the sphinx I want.

There's the search engine 'sphinx', which is what is packaged as
"sphinx" in Fedora, and which the documentation code obviously refuses
to use.

There's also CMU sphinx, which is a voice recognition system.

End result: building the docs can be really confusing if you have the
wrong sphinx installed, and the "help message" is actually misleading
and very unhelpful.

              Linus

