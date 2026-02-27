Return-Path: <ksummit+bounces-2846-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAejKGLGoWkVwQQAu9opvQ
	(envelope-from <ksummit+bounces-2846-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 27 Feb 2026 17:29:22 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F04F1BACCF
	for <lists@lfdr.de>; Fri, 27 Feb 2026 17:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95FC53020530
	for <lists@lfdr.de>; Fri, 27 Feb 2026 16:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038A839E6E6;
	Fri, 27 Feb 2026 16:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="K7cxZwL9"
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798D443C050
	for <ksummit@lists.linux.dev>; Fri, 27 Feb 2026 16:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772209759; cv=none; b=t7bUAFEoDjqleb4usnEngLcEH1ihX33rbW2MOrUqqOhYQ5hxcE/vyhSoAniH++Yj9dtBnsritPtlX3E/eqVY5lkFN5WaaCRuqJaGv0Hr0RRpv4r6T5BDiwRcAB7JDr9n5ieUTN6OqgPzIKBGO20BUGkkNRca72znbnReZWIPW4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772209759; c=relaxed/simple;
	bh=cEvXYoq8wWitsKiKnKIW5UIGzxff0whHsNMRY6TWVHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0fqy8Q4RPrmVefWzVnMZEo/IMy9GNz44CBIQ76bkzz28leIMOm6Pw9dsttoAXipOns8wk8qdNDKzY5njK5/9Kx74lFby18BUpsfDe07x6IWc+A21QLUy/FRxSx/TSj0Y4MslhPCnFsXzJrXpfeFg+JBK0mHDhBBUrnchwMtCOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=K7cxZwL9; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=O0sOnxzNYIoj0CTP9cLErzbD/g9vE38sWKaRwMv5k6Y=; b=K7cxZwL9CjILjNIb4WdUnzCuLH
	UUfVpuHjlyd6fZtcfQ+JHC0ItTdd7nytxDxQ/9FlM9nYhckHoriCc1bMk+MLLB3qCsxRbXIvO/Yxe
	M4NkAxZvNbNfTJjgYz202IPsJfihvUDrkIYXGDYnxxGaaPy12dqcnEHU/OcXJfxux/80pV3g0d/aF
	7hGqqNFguuC4pGIRqB9G+J6/jW2YagpFgwA38tV31z0eGK0KOxmzJJ/kEj5JgMYggrDpzXWpavWr4
	vfH2TCo/nCCXOcd7r0QRrT+Ym4pApNQb047SxNerG8Rc6Bk/G0trPLAAqMQFFKy+pkveoYol2BewE
	MHB6w1aw==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0iE-00000004qFT-3TCm;
	Fri, 27 Feb 2026 16:29:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9E52A30066A; Fri, 27 Feb 2026 17:29:09 +0100 (CET)
Date: Fri, 27 Feb 2026 17:29:09 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling
 update)
Message-ID: <20260227162909.GJ606826@noisy.programming.kicks-ass.net>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
 <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org>
 <20260227101631.67756268@gandalf.local.home>
 <677258882.1999.1772206555300.JavaMail.zimbra@nod.at>
 <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
 <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-2846-lists=lfdr.de];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,noisy.programming.kicks-ass.net:mid,get_maintainers.pl:url,linux-m68k.org:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 2F04F1BACCF
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 05:22:18PM +0100, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
> > Von: "Geert Uytterhoeven" <geert@linux-m68k.org>
> >> > I just told them to randomly modify the file, do a git diff and redirect it
> >> > into another file (making a random patch), and run get_maintainers.pl on
> >> > it. That's a big hack and having a better interface to point others too
> >> > would be useful.
> >>
> >> I'm pretty sure someone can vibe code us a neat webinterface which queries
> >> get_maintainers.pl in the background.
> > 
> > ... including a big fat message wrapped in a <BLINK> tag, which suggests
> > to check manually if a few addresses should be dropped?
> > 
> > Or perhaps this should be restricted to return mailing lists only?
> 
> Sure.
> What I have in mind is something like a web interface where you
> enter either the source file, module name, heck even a stack trace or a BUG/WARN_ON/Oops
> and the interface gives an advice how to mail to which mailing list.
> E.g. what information to include, how to send plain text mail, etc...

Oh, with these modern AI tools, you could even make that phone based and
accept screen shots... /me runs for the hills.

