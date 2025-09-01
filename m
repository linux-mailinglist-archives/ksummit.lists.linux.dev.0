Return-Path: <ksummit+bounces-2259-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C572AB3EE6F
	for <lists@lfdr.de>; Mon,  1 Sep 2025 21:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A67DD7AEBBD
	for <lists@lfdr.de>; Mon,  1 Sep 2025 19:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8199B32ED20;
	Mon,  1 Sep 2025 19:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJ/JR240"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D0F23D7E0;
	Mon,  1 Sep 2025 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756754879; cv=none; b=jBSQktA5jM9pm2OD5CS2RvRXrnlTxm8FOl7OkIEDilJZ26a+OYDd4tENIp+8//jWLMJ+NmsyA1X8aV4HgzoHakQB5jcA0bg2N1fb25izUSO/0wev53wi+XpBXpA11aOQVyeHj81Lo8MFyD3K57UzEmjW0VppnuX5hgHukGzsa1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756754879; c=relaxed/simple;
	bh=Zgw73WlWmeQnkq+xyhjYzMbvx3ApaiiBSUnrCWBqIZk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c2VqJsKbqa0AVi2aCUU3yJztwQkuTh01K3KNODfDQ9BTzuPe1lLSCF0RSGIvO+q0awIBMXYYHJ7adlsf++cFr9j1ejT8DWO1f4Z9WgaU++1W5bUOWfm/Wp83//R9X1SCndfuiTfeSqo9Lzv1wBGivYrV2C5W2FA3q1eQTMJglCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJ/JR240; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27A5C4CEF1;
	Mon,  1 Sep 2025 19:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756754878;
	bh=Zgw73WlWmeQnkq+xyhjYzMbvx3ApaiiBSUnrCWBqIZk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NJ/JR240XLxFjN4WfOUhHWiNNQHziOn+l3bk2lKQU3QPafVVvxvR41e3No+gaYn/c
	 YGoj//FySD3S1CWO1N/GdaQJ0bgbfoJf/cSCVC6ChK5Z1yoU4V5jNiwONBGG8jmsAi
	 FDAQ8C80pDKm6o8Dz+Cww+2Z5OsoSQ1OJKa9nIUyMalGxj2CAnNMKguV1y8GtKpPLf
	 I75p1f80DwTWF/6dlIhwmi7oUm8VXVOtYk1yF7lp4ko0n61dmrDvRdYskIXlh3xefx
	 S7hfsB8NJoPMSDZ/9SB0+PbcZatdOv3E8P0i5xfRQBkUfZk1xf51NoBezZo9aL3V0o
	 0MQHEqmOq2I9w==
Date: Mon, 1 Sep 2025 21:27:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250901212751.638cc4a8@foz.lan>
In-Reply-To: <636fe6e8-dc66-4521-a64a-4fb972e7ef39@infradead.org>
References: <87plcndkzs.fsf@trenco.lwn.net>
	<20250828230104.GB26612@pendragon.ideasonboard.com>
	<87wm6l0w2y.fsf@trenco.lwn.net>
	<930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
	<20250830222351.GA1705@pendragon.ideasonboard.com>
	<87h5xo1k6y.fsf@trenco.lwn.net>
	<20250831160339.2c45506c@foz.lan>
	<87zfbfz1px.fsf@trenco.lwn.net>
	<636fe6e8-dc66-4521-a64a-4fb972e7ef39@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 31 Aug 2025 23:17:22 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 8/31/25 1:16 PM, Jonathan Corbet wrote:
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >   
> >> 4) kernel-doc kAPI
> >>
> >> It shouldn't be that hard to do the same for kernel-doc kAPI documentation:
> >> kernel-doc now can parse the entire tree with:
> >>
> >> 	$ scripts/kernel-doc .
> >>
> >> Someone can easily use it to discover the current gaps at the docs that
> >> have already some kernel-doc markups and identify what of them aren't
> >> yet placed under Documentation/ ".. kernel-doc::" markups.  
> 
> Mauro, I tried that for one file: kernel/audit.c
> but didn't see what I expected to see.
> What options should I be using to find the gaps?

If you want to check all warnings kernel-doc detect, use -Wall:

	$ ./scripts/kernel-doc -Wall kernel/audit.c --none
	Warning: kernel/audit.c:216 No description found for return value of 'auditd_test_task'
	Warning: kernel/audit.c:254 No description found for return value of 'audit_ctl_owner_current'
	Warning: kernel/audit.c:265 No description found for return value of 'auditd_pid_vnr'
	Warning: kernel/audit.c:289 No description found for return value of 'audit_get_sk'
	Warning: kernel/audit.c:498 No description found for return value of 'auditd_set'
	Warning: kernel/audit.c:687 No description found for return value of 'auditd_send_unicast_skb'
	Warning: kernel/audit.c:747 No description found for return value of 'kauditd_send_queue'
	Warning: kernel/audit.c:841 No description found for return value of 'kauditd_thread'
	Warning: kernel/audit.c:1828 No description found for return value of 'audit_serial'
	Warning: kernel/audit.c:1860 No description found for return value of 'audit_log_start'
	Warning: kernel/audit.c:1937 No description found for return value of 'audit_expand'
	Warning: kernel/audit.c:2093 No description found for return value of 'audit_string_contains_control'
	Warning: kernel/audit.c:2359 No description found for return value of 'audit_set_loginuid'
	Warning: kernel/audit.c:2394 No description found for return value of 'audit_signal_info'

To be bug-compatible with the Perl version, I ported -Wall to it,
as otherwise there would be tons of extra warnings after migration.

Ok, it doesn't tell that there are exports there, although kernel-doc
knows, as it has to process exports anyway.

> > ...or one can use scripts/find-unused-docs.sh, which was written for
> > just this purpose :)  

It should be very easy to add an option to kernel-doc to do the same.

IMO, reducing the number of scripts may help people to better use
the tools.

> 
> Yes, and I have used this script. It does what it was meant to do AFAIK.
> It's reporting is at a gross file level.
> 
> I made a small subdirectory called "test" and copied kernel/audit.c to test/.
> 
> $ ./scripts/find-unused-docs.sh  test/
> The following files contain kerneldoc comments for exported functions that are not used in the formatted documentation
> test/audit.c
> 
> Sometime in the last 2-3 years Matthew Wilcox asked me about a tool (script, whatever)that would detect both EXPORTs without kernel-doc and kernel-doc without EXPORTs.
> Either one of these can be noisy (with false positives) and they often don't lend
> themselves to easy/beginner fixes.

Heh, not knowing/remembering about find-unused-docs.sh, I actually
wrote a prototype for something similar sometime ago, in Perl.
Didn't upstream it though, nor used it much as I got sidetracked
by other things. My goal on that time were to find gaps on media kAPI.

> Anyway, after some delay, I have such a script. It's written in Perl (I started
> on it over a year ago!). It might have been desirable to add it to scripts/kernel-doc.pl
> at the time, but it didn't seem to me like a good fit there, so it's independent.
> 
> Running (no options, just produce a summary)
> $ kerndoc-export-search.pl test/audit.c
> reports:
> Missing kernel-doc for: audit_log_task_info
> Missing kernel-doc for: audit_enabled
> Missing kernel-doc for: audit_log_task_context
> 3 missing kernel-docs
> Missing EXPORT for: audit_serial
> Missing EXPORT for: audit_log_untrustedstring
> Missing EXPORT for: audit_log_n_untrustedstring
> Missing EXPORT for: audit_log_n_hex
> Missing EXPORT for: audit_log_lost
> Missing EXPORT for: audit_set_loginuid
> Missing EXPORT for: auditd_test_task
> Missing EXPORT for: audit_ctl_lock
> Missing EXPORT for: audit_string_contains_control
> Missing EXPORT for: audit_signal_info
> Missing EXPORT for: audit_log_path_denied
> Missing EXPORT for: audit_ctl_unlock
> 12 missing Exports
> 
> If that's not verbose enough (!), the -l (list) option lists each function's
> location and short description. One example:
> test/audit.c: 2006: audit_log_format:  * audit_log_format - format a message into the audit buffer.

Nice! Yet, I suggest trying to merge with kernel-doc, even if the
actual implementation would be on a separate class inside a
separate file.

Still, the way kernel-doc works allow one to just write a different
output class (or improve the output class used by --none) to use
the already parsed data on different ways.

> But that generates lots of output.
> 
> And of course, for function, I mean function/struct/union/enum/typedef.
> 
> There is a "verbose" option but it currently does not print anything.
> 
> Here is a help summary:
> $ kerndoc-export-search.pl -h
> kerndoc-export-search.pl [--list|-l] [--verbose|-v] file(s)
>   where --list    prints filename:line:funcname: short_description
>   where --verbose prints more info.
>   default: prints a doc/export summary + warnings.
>   version: 0.9
> 
> 
> Feel free to use in any way or to rewrite & merge it into the
> kdoc python system.

Good to know! I'll try to take a look on it later on.

Thanks,
Mauro

