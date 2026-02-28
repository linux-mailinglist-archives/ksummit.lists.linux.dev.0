Return-Path: <ksummit+bounces-2854-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HRDGNNjo2myBQUAu9opvQ
	(envelope-from <ksummit+bounces-2854-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 28 Feb 2026 22:53:23 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 277C01C94F6
	for <lists@lfdr.de>; Sat, 28 Feb 2026 22:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4D8A31B324A
	for <lists@lfdr.de>; Sat, 28 Feb 2026 20:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C80B305057;
	Sat, 28 Feb 2026 20:56:24 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB072DA75B
	for <ksummit@lists.linux.dev>; Sat, 28 Feb 2026 20:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772312183; cv=none; b=A4kdjcrFl2IQN4vVg4u/wbmtjIdNYERxwGs+ETqF9MPmJns7ejmF8o6baPN7NP6LmI6qBY6HwMf+D8JF8e3zaYjBYD0l0vN2FBUCsBLnZYIFOypmARi3EjfutSb+5DkhS/5Ycy+huOp0hGux22oOqWKg1SNH8zR1QH6s31JGKII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772312183; c=relaxed/simple;
	bh=Hsn++XYoUBVYy8yLiHIYqYW5faQIWkH0b88ruY8T8m0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mth0jc4h9BxTmX0+5gg4tZ5UPc3vtY7vvyYJNKjV5a0IZU259KyXqpR/DcFDGvm+sHdAs7N2MxRJoRMsv6/apnDQDTlRqD551sX1byRr7CuAhAiavqW631h7N6oOLSh/IYoFYx4kP9T8v4ZRLplTjBEM5gsvUDg/G7xzSkGqTSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 986731402A7;
	Sat, 28 Feb 2026 20:56:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 79D7120027;
	Sat, 28 Feb 2026 20:56:12 +0000 (UTC)
Date: Sat, 28 Feb 2026 15:56:11 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Richard Weinberger <richard@nod.at>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Thorsten Leemhuis
 <linux@leemhuis.info>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew
 Morton <akpm@linux-foundation.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, users <users@kernel.org>, ksummit
 <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla?
Message-ID: <20260228155611.70911c0f@fedora>
In-Reply-To: <583136576.604.1772310537428.JavaMail.zimbra@nod.at>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
	<1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
	<5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
	<1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
	<CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
	<1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
	<20260228152617.06b392de@fedora>
	<583136576.604.1772310537428.JavaMail.zimbra@nod.at>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: yrnwmicno4rkr13f7m6yxn4f4955czw7
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19ZxK5qWyid9e7B7TKPvYBauWatUljwa60=
X-HE-Tag: 1772312172-898610
X-HE-Meta: U2FsdGVkX197hPJgARlARHIO8Shv4XYCxG/hF2TpElc1O6RarkuQX40BnjKgoN8UKcOhKPseJ7nlkY9B5tqIa5f8fgcV0FTgqJorQO+hW6Rw0QKF264qjU2fuWjAR38NhZbm5ePD4kc1zEMd8i4dx0vKOGvUEMDzVNSQosSbnL6z05nOGbbOBlIpFVZPBbgsyg0El3VmcjfMuwDXwkUPQJodtbRjU4+ngscOm9+QRdvqjepEYPR2Ay1EgxbdFu8mWrOd5CmqIzQDD7g7FYDY3w2YbFv15XdUmg850UgzQ3z/h9EDyBSEC33DyB5zR5Dor189RY8wxM8a6Q9GkVTZDRUuSJTBA+HZjgXsTVBQp5g=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2854-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,ksummit@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 277C01C94F6
X-Rspamd-Action: no action

On Sat, 28 Feb 2026 21:28:57 +0100 (CET)
Richard Weinberger <richard@nod.at> wrote:

> Wouldn't that only work if the report is able to upload the kernel debug
> info too?

Yes, this would be nice if we had the help from the distros that could
automate this process.

-- Steve

