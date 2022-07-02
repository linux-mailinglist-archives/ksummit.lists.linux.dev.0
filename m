Return-Path: <ksummit+bounces-740-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A53BB563F86
	for <lists@lfdr.de>; Sat,  2 Jul 2022 12:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 1D8E62E0C8D
	for <lists@lfdr.de>; Sat,  2 Jul 2022 10:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD5E1FDC;
	Sat,  2 Jul 2022 10:53:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FC41FBC
	for <ksummit@lists.linux.dev>; Sat,  2 Jul 2022 10:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2833C34114;
	Sat,  2 Jul 2022 10:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656759179;
	bh=OQPK4pW4oC6YDuWb3JMcdvKCtVhk9MwGdypkuKGaGlc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NDN/9VJNSdrdn33vPxOBmSes1E8r/kA0MZ1HCMHj9ACj0vxoY9PWtYjoGVLVvMgdB
	 YcJx8w/Juuqe6I7kA3wHlD8r7f/8qDu2m2fwnzWFg0ZrSakK4wQKC8cBeoPj238BZY
	 NmutIMbVvWsP7qWFPXxHFBZjcVQ8z3hm4mjbEkG1bMQA1c92KPYFogv+2fziwWVtSl
	 mglCgCmnnTjQ3M6ExoByj8XclKxWCMc/Up9ophMSxOAOn5oNnMt5TSiQSuJ0QU17P4
	 UjxDOQW8Fa+OvWhDgougvZmZ2Mvekei3NlDmkB00TnMPTrWc5nANc56TsYqt8jReBq
	 xRDxlKDUiEUfQ==
Date: Sat, 2 Jul 2022 11:52:52 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 ksummit@lists.linux.dev, Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220702115252.3953d316@sal.lan>
In-Reply-To: <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
References: <87sfo3nh3t.fsf@meer.lwn.net>
 <20220618092447.5ebed314@sal.lan>
 <875ykrrb45.fsf@intel.com>
 <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net>
 <20220624083307.159824bd@sal.lan>
 <87tu891xfv.fsf@meer.lwn.net>
 <20220625101029.67f14c4c@sal.lan>
 <87czew267z.fsf@meer.lwn.net>
 <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 25 Jun 2022 11:11:40 -0700
Linus Torvalds <torvalds@linux-foundation.org> escreveu:

> On Sat, Jun 25, 2022 at 7:00 AM Jonathan Corbet <corbet@lwn.net> wrote:
> >
> > I said "some" - this was a proof-of-concept hack.  The complexity of
> > their symbol lookup code is ... daunting ... and not something that gets
> > fixed in one place.  More research is required...  
> 
> Note that at least for me, the issue with building docs isn't hugely
> performance related.
> 
> Yes, yes, it would be good if it was faster. But..
> 
> The primary problems I see with building the docs (and thus checking
> them, the same way I do an allmodconfig build test) is
> 
>  (a) it's insanely noisy, which makes and "check that it's ok" ENTIRELY USELESS.

I solved almost all warnings that can be fixed against -next.
Sending patches today.

However, there is an special case where warnings will be hit for perfectly
fine code, when docs are built with Sphinx 3.0 and upper:

	Documentation/driver-api/usb/usb:164: ./drivers/usb/core/message.c:967: WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget:783.
	Declaration is '.. c:function:: int usb_string (struct usb_device *dev, int index, char *buf, size_t size)'.
	Documentation/driver-api/usb/usb.rst:967: WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget:783.
	Declaration is '.. c:struct:: usb_string'.

In this specific case, there are both a struct and a function named 
"usb_string". So, the above is not an issue. While this is not fixed,
there will be a 22 lines noise (11 two-line warnings) after my fixes[1].

The root cause is that Sphinx has a single namespace for symbols, no matter
if the symbol is a function, a struct, an enum, etc. So, when the same
name is declared on multiple places, like in the case of "usb_string",
the cross-references will either point to the function or to the struct.
While this is annoying, it is usually not a big deal, as they are
typically placed at the same rst file.

While this problem affects *all* Sphinx versions so far, Sphinx 2.x.x 
doesn't warn when this happen, but newer versions complain about that. 
This is a well known issue and there are patches fixing it since 
Sphinx 3.1:

	https://github.com/sphinx-doc/sphinx/pull/8313

Those patches were expected to be merged on Sphinx 3.3, but ended
not being merged so far, as applying them would break support for
a Sphinx extension that it is used on several places.

---

[1] I got one case where the warning was actually reporting an issue:

	Documentation/driver-api/hte/tegra194-hte:28: ./drivers/gpio/gpiolib.c:2464: WARNING: Duplicate C declaration, also defined at driver-api>
	Declaration is '.. c:function:: int gpiod_enable_hw_timestamp_ns (struct gpio_desc *desc, unsigned long flags)'.
	Documentation/driver-api/hte/tegra194-hte.rst:2464: WARNING: Duplicate C declaration, also defined at driver-api/gpio/index:2464.
	Declaration is '.. c:function:: int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)'.

Basically drivers/gpio/gpiolib.c is included twice for the same
symbols, one at Documentation/driver-api/gpio/index.rst, and then 
Documentation/driver-api/hte/tegra194-hte.rst includes it again for 
gpiod_enable_hw_timestamp_ns() and gpiod_disable_hw_timestamp_ns().

Regards,
Mauro





