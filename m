Return-Path: <ksummit+bounces-2843-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOYpDh2/oWnPwAQAu9opvQ
	(envelope-from <ksummit+bounces-2843-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 27 Feb 2026 16:58:21 +0100
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7F31BA6B4
	for <lists@lfdr.de>; Fri, 27 Feb 2026 16:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FBCC307BA74
	for <lists@lfdr.de>; Fri, 27 Feb 2026 15:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FD643E9EC;
	Fri, 27 Feb 2026 15:45:06 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E0E43DA56
	for <ksummit@lists.linux.dev>; Fri, 27 Feb 2026 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207106; cv=none; b=fRqkrx9LMx1rZoP4c52C8f8UtVtiZ9/gMbeqmwrLK718eSdBubFCYlzMR1PkDeOrHQco9HMtkOWoYKEMDdfKIm7JdexAmDDUMZqRQFagD2QeDty9e3IJjlI6Wpb6Qeb9KLXIu+BDmt1avP4x1KzwxAq8qfm5LnWaswYIxlLlVzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207106; c=relaxed/simple;
	bh=acCFWFL5cQQMzlwaF3nKbcKIsIgKCJNZmkUSWADJo3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LsnWbj7t7auJLsBcI3SAOw+EYdAVjYDWg4eVKAcMr6Y8ulL6ncGckdUB5boje7tTb231Txn4UE2nw93lEuzfdtdMmjp82mner1x3txa8GfSM5txH3cXtZllo9g22+rLTKz+D+RS9MrCqrFQ8XCqkBs7VzwVrTZDOD4R8Lf+HQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 703DDBB231;
	Fri, 27 Feb 2026 15:45:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 70BCA20011;
	Fri, 27 Feb 2026 15:45:01 +0000 (UTC)
Date: Fri, 27 Feb 2026 10:44:59 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thorsten Leemhuis
 <linux@leemhuis.info>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, users@kernel.org, ksummit@lists.linux.dev
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling
 update)
Message-ID: <20260227104459.2ff7b561@fedora>
In-Reply-To: <f1366d58-c3bb-464c-8436-5770a9eb8c91@sirena.org.uk>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
	<20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org>
	<20260227101631.67756268@gandalf.local.home>
	<f1366d58-c3bb-464c-8436-5770a9eb8c91@sirena.org.uk>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: jepqp6etrsrk695juxhrhm4dkm59qbxm
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/XRfDgazMX/EJrcLPpY2Ym2E8T9X5CfRg=
X-HE-Tag: 1772207101-79334
X-HE-Meta: U2FsdGVkX1/tVqhqUm6VHTtHZOLe+qmTUi6c2hKmH7WaHW16qLDp8iwo6oqmKSiB+ilUgtx1gUg5onxSkUHr/475h11UhYOA+Hg61SUQvv415Bc6Ka7zsNlIunMVzFnHZ+rbXAv0e5ciP+KhjCVbQJlpgCUPYKaGNm/F+HH1Bp9BeLYdbiWuVHyrmMIN+v23N3e+4YenQHkoCoNq/dh08zNLg00FVE2Pltd9s/VR3qwZM0Bamq1a5Q3UJG8O5CLH70hpFxm7y1OS12MLJjN7KppNzOEYTyRoZVVk4wzhGbIZTgGOc3nhshLgQZcocvGhBxYNZABfqz7dbeSanTpRerfkY7SStYHQ
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-2843-lists=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[get_maintainers.pl:server fail,sin.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,get_maintainers.pl:url]
X-Rspamd-Queue-Id: 4D7F31BA6B4
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 15:18:10 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Fri, Feb 27, 2026 at 10:16:31AM -0500, Steven Rostedt wrote:
> 
> > This actually sounds like a good idea. Someone just told me that they found
> > a bug in a driver and I asked them if they notified upstream about it. They
> > said no, because they didn't know how.  
> 
> > I just told them to randomly modify the file, do a git diff and redirect it
> > into another file (making a random patch), and run get_maintainers.pl on
> > it. That's a big hack and having a better interface to point others too
> > would be useful.  
> 
> ./scripts/get_maintainer.pl --file is a bit more direct there.

Yeah, I always forget that it can handle files. I only run it on
patches. I was also using it as a way to get someone used to making
patches ;-)

-- Steve

