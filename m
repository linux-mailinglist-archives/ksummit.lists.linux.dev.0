Return-Path: <ksummit+bounces-834-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAAC5F2233
	for <lists@lfdr.de>; Sun,  2 Oct 2022 11:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08B1B280CCC
	for <lists@lfdr.de>; Sun,  2 Oct 2022 09:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9722567;
	Sun,  2 Oct 2022 09:14:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B819323D8;
	Sun,  2 Oct 2022 09:14:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9642721991;
	Sun,  2 Oct 2022 09:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1664702063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=odn8KQneE0kpASZK9Ha3Rs5F6ddhOuSQVljDpnP08Qc=;
	b=lITgmIrQDrZBn6sOI2UmxEiebHqFZGC4CXlFVmN50TPM8FGkiYBPS+ToCD/FH7vHcQ8458
	bWkqmIgAzEEwlChybftPeoO59qXOkmUdvPPKRW7GPZkUfgk34JlRmwCwxkj3BfLlnYjC3V
	lnz7Cw++0RbTReGcN0cBhfvrqJ8iWKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1664702063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=odn8KQneE0kpASZK9Ha3Rs5F6ddhOuSQVljDpnP08Qc=;
	b=u9SU1g4HohgDeNbzWEXnAcXmLM/WXOUbYR1zepxWHCX0yNLDMG21bUAFnoWFJIvw0PLZQv
	VuMhnWqwCGrRPyBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53F6313AA3;
	Sun,  2 Oct 2022 09:14:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id E02BE29WOWO9SAAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 02 Oct 2022 09:14:23 +0000
Date: Sun, 02 Oct 2022 11:14:22 +0200
Message-ID: <87h70mvb81.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
In-Reply-To: <56a04cae-7240-9005-4931-5b3e9f598ffb@gmx.com>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
	<05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
	<9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com>
	<87pmfavfpt.wl-tiwai@suse.de>
	<56a04cae-7240-9005-4931-5b3e9f598ffb@gmx.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII

On Sun, 02 Oct 2022 10:23:07 +0200,
Artem S. Tashkinov wrote:
> 
> 
> 
> On 10/2/22 07:37, Takashi Iwai wrote:
> > On Sat, 01 Oct 2022 12:30:22 +0200,
> > Artem S. Tashkinov wrote:
> >> - 2 -
> >> 
> >> Here's another one which is outright puzzling:
> >> 
> >> You run: dmesg -t --level=emerg,crit,err
> >> 
> >> And you see some non-descript errors of some kernel subsystems seemingly
> >> failing or being unhappy about your hardware. Errors are as cryptic as
> >> humanly possible, you don't even know what part of kernel has produced them.
> >> 
> >> OK, as a "power" user I download the kernel source, run `grep -R message
> >> /tmp/linux-5.19` and there are _multiple_ different modules and places
> >> which contain this message.
> >> 
> >> I'm lost. Send this to LKML? Did that in the long past, no one cared, I
> >> stopped.
> >> 
> >> Here's what I'm getting with Linux 5.19.12:
> >> 
> >> platform wdat_wdt: failed to claim resource 5: [mem
> >> 0x00000000-0xffffffff7fffffff]
> >> ACPI: watchdog: Device creation failed: -16
> >> ACPI BIOS Error (bug): Could not resolve symbol
> >> [\_SB.PCI0.XHC.RHUB.TPLD], AE_NOT_FOUND (20220331/psargs-330)
> >> ACPI Error: Aborting method \_SB.UBTC.CR01._PLD due to previous error
> >> (AE_NOT_FOUND) (20220331/psparse-529)
> >> platform MSFT0101:00: failed to claim resource 1: [mem
> >> 0xfed40000-0xfed40fff]
> >> acpi MSFT0101:00: platform device creation failed: -16
> >> lis3lv02d: unknown sensor type 0x0
> >> 
> >> Are they serious? Should they be reported or not? Is my laptop properly
> >> working? I have no clue at all.
> > 
> > That's a dilemma.  The kernel can't know whether it's "properly"
> > working, either -- that is, whether the lack of some functions matters
> > for you or not.  In your case above, it's about a watchdog, something
> > related with USB, TPM, and acceleration sensor, all of which likely
> > come from a buggy BIOS.  Would you mind if those features are missing?
> > Or even whether your device has a correct hardware implementation?
> > Kernel doesn't know, hence it complains as an error.
> > 
> > In many drivers, there are mechanisms to shut off superfluous error
> > messages for known devices.  So it's case-by-case solutions.
> > 
> > Or you can completely hide those errors at boot by a boot option
> > (e.g. loglevel=2).
> 
> The problem is some of such messages are indeed indicative of certain
> real issues which result in HW not working properly, including:
> 
> 1) missing/incorrect firmware
> 2) most importantly: not enabled power saving modes
> 3) not enabled high performance modes
> 4) not enabled devices
> 5) not enabled devices' functions
> 6) drivers conflicts (i.e. the wrong module gets loaded for the device)
> 7) physically failing hardware
> 
> I'm quite sure you don't really know what half of those messages
> actually mean.

Of course: not because those messages are hardly understandable but
because those messages indicate only the cause, and the exact end
result can't be always known from the kernel at that point.  A lack of
physical failing hardware?  Not enabled devices?  Who knows.  There
might be some alternative, even a user-space driver.

> Speaking of 7. Various kernel subsystems/drivers deal with e.g. mass
> storage which is known to fail quite often. There's not a single driver
> in the kernel which is actually brave enough to spew something like this:
> 
> "/dev/xxxx might be failing, please RMA or seek help online"
> 
> instead you get a dmesg choke full of "unable to read sector XXX" or
> something like that.

Oh you suggest that we should put "please RMA or seek help online" to
each printk of KERN_ERR level, if it saves the world? ;)

IMO, what matters for users is whether the system works or not.  It's
not how the kernel message appears.  A kernel message may help for
diagnose, but the message itself is no solution; that is, the most
importance of a kernel message is that it indicates a real error that
can be diagnosed by developers.

If the end effect is pretty sure, a message may be more chatty.  OTOH,
people are annoyed by such too verbosity, too.  So it needs a sensible
choice.

> To return to the previous errors: it's impossible for the user to assess
> their severity and that sucks.

Right, that's why I wrote it's a dilemma.

> What is "platform device creation
> failed"? What is "unknown sensor type"? What am I missing? Who's
> responsible? The kernel? My HW vendor? Are those errors actionable?

All those depend on the driver implementation and the hardware
implementation.  There is no general answer at all, unfortunately.

> In
> my understanding a properly working computer must not produce
> "emerg,crit,err" errors. I'm not even talking about "warn,info" and such.

Yes, some errors can be downgraded to warn or even to info.
I myself find ACPI is way too chatty, too.

So I believe something we can improve is to define some more clear
guideline for KERN_ERR level errors.


Takashi

