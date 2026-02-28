Return-Path: <ksummit+bounces-2852-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFoIGi9io2myBQUAu9opvQ
	(envelope-from <ksummit+bounces-2852-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 28 Feb 2026 22:46:23 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8FB1C93D3
	for <lists@lfdr.de>; Sat, 28 Feb 2026 22:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CB11310DD84
	for <lists@lfdr.de>; Sat, 28 Feb 2026 20:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DFE26A1AC;
	Sat, 28 Feb 2026 20:26:29 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD402430B8C
	for <ksummit@lists.linux.dev>; Sat, 28 Feb 2026 20:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772310389; cv=none; b=FXG6WHhvXD/MKsLZvOviCajZexgbSxsnYXzjNxBtAVuuSqGF8ji6DHuafYUKLYvhaf/Xz2oddjWCoOIGDI5y1RBcxGCqAvV+IGpjxv3VmI5VQtVpavPCg93WnJBC00KfB15y04fAWNua3bTZbRqENxE4LXGq1RRpMOFJnh5khZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772310389; c=relaxed/simple;
	bh=IoCxypwFO1fH6O1KdaUIye9qGJKRgHSapqlQ8eK9VaY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SslKHGZHJB59KszrZub7JySliA45+HLcMtPOykDuXpedOOd7XNI+x3fsX4Z+hnm4NRw1CL4jk4TV/L2T56zMDQuIDKCeNdNNdqkqaZ/Cbky2vFidf5y/0H763Im6ESi6J8j6ofSx/kmowsp4EmOMKhjc7FgJBOBFctG8FWolBeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 0B056136F48;
	Sat, 28 Feb 2026 20:26:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id DD95820025;
	Sat, 28 Feb 2026 20:26:18 +0000 (UTC)
Date: Sat, 28 Feb 2026 15:26:17 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Richard Weinberger <richard@nod.at>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Thorsten Leemhuis
 <linux@leemhuis.info>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew
 Morton <akpm@linux-foundation.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, users <users@kernel.org>, ksummit
 <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla?
Message-ID: <20260228152617.06b392de@fedora>
In-Reply-To: <1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<20260227101631.67756268@gandalf.local.home>
	<677258882.1999.1772206555300.JavaMail.zimbra@nod.at>
	<CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
	<1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
	<5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
	<1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
	<CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
	<1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ud6cscq6bm8xqwiecpkomn4zez5q88ee
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18OgmkYJ0tW6UA23bWKI/arI2qE6nOV15c=
X-HE-Tag: 1772310378-123105
X-HE-Meta: U2FsdGVkX1/TB5OLkrC4fbaZ+AMw//leNWiphc7O50pWoSeY13+WyrOtj/hssNnTiCvxcWoyksfzGs+UJdDPddjBzD3OmxGqOsYr2NlIQgIRYc6vPonE6KTbmXU3zmU7w0cGZltz6mTjUyKPcZcEmp23CymGAgcMj6EWql1xQAM1A1W/IyNix2qfrfATjgLxSaHnkOXb+pJuj2phw/qGgs7jBVOkL7yHN9/h+6/L7FMnc9DB0gghlp2EJu8D5KC5iiSWtuAhmdIuajAKXBEFt5XuiJwgDvIWshfcU4dUHkmLhj0dX6Cw8+emJeo31Mnz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2852-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,ksummit@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nod.at:email,get_maintainers.pl:url]
X-Rspamd-Queue-Id: 6D8FB1C93D3
X-Rspamd-Action: no action

On Sat, 28 Feb 2026 19:29:24 +0100 (CET)
Richard Weinberger <richard@nod.at> wrote:

> > Apparently not enough people know about this.

decode_stacktrace is awesome. It's better than my old method of using
gdb with li *<addr>, as it also handles inlined functions and gives you
the file and line number of what called the inlined function.

> > 
> >  uart_write (drivers/tty/serial/serial_core.c:72
> > drivers/tty/serial/serial_core.c:598)
> >  handle_tx (drivers/net/caif/caif_serial.c:237)
> >  caif_xmit (drivers/net/caif/caif_serial.c:284)
> >  dev_hard_start_xmit (./include/linux/netdevice.h:4833
> > ./include/linux/netdevice.h:4847 net/core/dev.c:3601
> > net/core/dev.c:3617)
> > 
> > which is really a lot easier for people to figure out where things happened.  
> 
> Of course. But I had a different use case in mind.
> I thought about pasting whatever stack trace a user finds in dmesg/syslog
> into a web interface to find the most suitable mailing list to report to.
> 
> *If* debuginfo and tooling is available to the user, of course they should
> include the decoded stack trace to the report.
> How to do that should be included in the instructions on how to report
> the issue by mail.

What would be great is if a tool took the current crash, ran it through
decode_stacktrace.pl, and then run the files it produces through
get_maintainers.pl and then Cc a subset of people that are most likely
to be able to figure it out.

-- Steve

