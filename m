Return-Path: <ksummit+bounces-2042-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C043EB1B87D
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71C0217D43B
	for <lists@lfdr.de>; Tue,  5 Aug 2025 16:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3872B275B0D;
	Tue,  5 Aug 2025 16:28:09 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECDC291C0F
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 16:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754411288; cv=none; b=IxXjXXoN2dSMjrpRY1B6Mhi8tCgA19MTzJ01ugfOIPIyV54QAUEWVOG0QOcmF2f4SU3BM/AfbwK8OFLbTaGrgIN5THXXrhw2BSlDAUq1r6x2OoMlsmGKF3CR5QmrLSc8wKMOk+pRRdVHrNghJxIfHhWm++/EqpWyo5VpdfQ4Yh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754411288; c=relaxed/simple;
	bh=uK5LfdB6rqKF9vtw20pG0tGISx8yvEKCxMgnhlzaqFo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=em5LqtlAWg+C+0fYEBKCLyBkwPZFlP3YC0huWBQrATb53d1jn+Y7lcB8ZJAOqSQhntTsgShZGRo6gRY0xa+SYmDWHQgtAbDqKLJx074+cf0uDLt+O1Vrb9CF+Y6KFJqPaWMZlWkDE+musuJW7cRS+chtMCCaN93/mQ1r6k24CMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 51BCCC017B;
	Tue,  5 Aug 2025 16:28:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id C51672000E;
	Tue,  5 Aug 2025 16:27:58 +0000 (UTC)
Date: Tue, 5 Aug 2025 12:28:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <20250805122828.68312a8d@gandalf.local.home>
In-Reply-To: <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
	<9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: op4pk41eu4hdbig9fo7yty4phs4af3ed
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: C51672000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/W82lSLc+Owv1o0SpPT0ph329bgKhNxXM=
X-HE-Tag: 1754411278-297465
X-HE-Meta: U2FsdGVkX1+jW7fWGr0m1rtiGnZPASvYaXTiSgjXMrYDUEwDFY31TjNzmbqpvPpvcK1QthBx+NyhYxprBo8wSbpzL5jXwsn8QWixwGjCjbh+IBZ8p2Q7foEXnXEcnVLmEcvfGJxGpf4fTABTSpYVu5+edPp6HGUpGEqMf/IFTDe02xWgo11k8NbHM3Gxj0ax9j0T1/92rUcw7YEP8SennYWgicvQOq8Su8/c+K10FBPz8mEWRQ2llzxnWLOBOGshwEpzfVdd/OXebQfyEAD8NtmIW9N4bl8FlZFqnMu/a2Toj2HvzuVzzH8jDNsjgJac1g52Mo64RfAT25HygS/eEB6ZfBLYWYJs

On Tue, 5 Aug 2025 17:08:44 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Tue, Aug 05, 2025 at 05:38:55PM +0200, Jiri Kosina wrote:
> 
> > This proposal is coming as a followup to the brief IRC discussion that 
> > happened a few months back.  
> 
> > The amount of e-mails that are coming (with maintainers directly CCed) as 
> > a result of patches being merged to -stable is so overwhelming that I am 
> > not sure that people are making any productive use of it whatsoever.  
> 
> > I am personally pretty much ignoring most of it, as (a) I wouldn't have 
> > time to do anything else otherwise (b) I don't have a sufficient 
> > motivation / time to invest effort into stable in the fist place.  
> 
> > I feel it'd be beneficial to discuss this, and (depending on the outcome) 
> > perhaps make it opt-in (or opt-out) at least, with people/subsystems 
> > having means how to be excluded from all that ... ?  

I have a love hate relationship with these stable emails.

I like to see what is happening but I just don't have the time to review
them. But every so often, one catches my attention where I think a patch
shouldn't be added. But that's very few and far between.

Now, if something is marked for stable, I really don't want to be bothered
that it made it to a stable tree. If I marked something for stable, sending
me an email that it was applied is rather redundant.

I do care about the patches that are marked but fail to apply. I like
getting those emails. Although I still don't have the time to fix them :-p

> 
> One thing I'd really like to see there would be to avoid sending each
> patch separately for every stable version, that just blows up the mail
> volume hugely especially for those of us with subsystems that carry a
> lot of quirks.  I'm sure the range of versions something is being pulled
> back to could be expressed in a single mail instead, it's always some
> range of versions being processed en masse rather than just a single
> version.  The per version cover letter is more useful for replying with
> test results but that doesn't need the whole series.

Yes, I agree that a digest of all the autoselects would be good.

Possibly even a link to the stable git tree of the commit each was added to
would work.

-- Steve




