Return-Path: <ksummit+bounces-1438-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8A93266A
	for <lists@lfdr.de>; Tue, 16 Jul 2024 14:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 692D51F22EC1
	for <lists@lfdr.de>; Tue, 16 Jul 2024 12:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1791991B0;
	Tue, 16 Jul 2024 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tWnMZUxJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MoibYTfh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tWnMZUxJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MoibYTfh"
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6F9197A8E
	for <ksummit@lists.linux.dev>; Tue, 16 Jul 2024 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721132414; cv=none; b=MZfoaRFTs/a93h536Gwuv7ATQGx0R3o0Eis2HDWmmKnHkDzNy365cH1FLs48A81cbCOR8Wb3Q8O3WZIAnBfDkKqStziYhjafYuYWUXsPXoC0C/eE3xviawk1uhRA18LhjCFIK6nFeugvCSrkLA3UwrMGY1mgtWopQCSJm8Bexv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721132414; c=relaxed/simple;
	bh=5P98M+xqAfHFhVGjhS6UUB7jkM4XWVsYQK/GVZav6fk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QnLUy7+YyRtY5zpaEPf7fBSCjp36rZKwOLzhE7jOToJZ8clVbpMLQ1HWFl2rmWSKx/oLVqQc/E/Vu+QZpmKuKJxnAezeyI4qRq2tSywrtKhlK81NLsSds17XB8U555k9qMgwGqCdMpuiOw9C+D7K4Cw/BSiSFFqg+EeCyqFV0qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tWnMZUxJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MoibYTfh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tWnMZUxJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MoibYTfh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 30A5221B2F;
	Tue, 16 Jul 2024 12:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721132410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gn82iWTkNzrDT4j1IONzdxqa12oy8WGn5IaGsT9Xm10=;
	b=tWnMZUxJ1MH0vn8vUhr1OA7i/Ndd1Rx0ejUHRY0eXH++KRuxlE13Gbcr0+W6oM7rv7VXbU
	FIlS748weWLYg4ZgvpWfCqw0twNyAcSxnBz4kqobjPXlsuSmUWAdsX6VboLwpb8BFqGb9m
	F4UiUvsgJX00wOfwej89T8skT6VIs5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721132410;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gn82iWTkNzrDT4j1IONzdxqa12oy8WGn5IaGsT9Xm10=;
	b=MoibYTfhlTD/Bi4oSc6TwzhLc1tg1GFV0pkj1HBe0PoT7mIah4Hl3P55NUbJuSNGI4nxIU
	W7W3nKa34pebsmAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tWnMZUxJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MoibYTfh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721132410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gn82iWTkNzrDT4j1IONzdxqa12oy8WGn5IaGsT9Xm10=;
	b=tWnMZUxJ1MH0vn8vUhr1OA7i/Ndd1Rx0ejUHRY0eXH++KRuxlE13Gbcr0+W6oM7rv7VXbU
	FIlS748weWLYg4ZgvpWfCqw0twNyAcSxnBz4kqobjPXlsuSmUWAdsX6VboLwpb8BFqGb9m
	F4UiUvsgJX00wOfwej89T8skT6VIs5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721132410;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gn82iWTkNzrDT4j1IONzdxqa12oy8WGn5IaGsT9Xm10=;
	b=MoibYTfhlTD/Bi4oSc6TwzhLc1tg1GFV0pkj1HBe0PoT7mIah4Hl3P55NUbJuSNGI4nxIU
	W7W3nKa34pebsmAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F2E4D136E5;
	Tue, 16 Jul 2024 12:20:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nUoVOnlllmYOVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Jul 2024 12:20:09 +0000
Date: Tue, 16 Jul 2024 14:20:42 +0200
Message-ID: <87frs91qat.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Sasha Levin <sashal@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
In-Reply-To: <2024071605-bulb-plop-9cea@gregkh>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	<915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
	<ZpQbQa-_8GkoiPhE@sashalap>
	<f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
	<ZpQyeLFJY1gJvRRA@sashalap>
	<20240715180000.GC70013@mit.edu>
	<fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
	<ZpWK0m7Ps6Y4vjL2@google.com>
	<2024071605-bulb-plop-9cea@gregkh>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 30A5221B2F
X-Spam-Flag: NO
X-Spam-Score: 1.99
X-Spam-Level: *
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.99 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,mit.edu,kernel.org,hansenpartnership.com,lists.linux.dev];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Action: no action
X-Spamd-Bar: +

On Tue, 16 Jul 2024 08:28:53 +0200,
Greg KH wrote:
> 
> On Mon, Jul 15, 2024 at 01:47:14PM -0700, Dmitry Torokhov wrote:
> > On Mon, Jul 15, 2024 at 02:06:55PM -0500, Dan Carpenter wrote:
> > > On Mon, Jul 15, 2024 at 02:00:00PM -0400, Theodore Ts'o wrote:
> > > > On Sun, Jul 14, 2024 at 04:18:00PM -0400, Sasha Levin wrote:
> > > > > From my experience, most issues tracked by regzbot and fixed upstream
> > > > > don't actually have a stable tag. Here's one I just looked at a few days
> > > > > ago: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f451fd97dd2b78f286379203a47d9d295c467255
> > > > > 
> > > > > And I'm actually happy to point to that one as an example because the
> > > > > ext4 folks are usually great about stable tags.
> > > > >
> > > > > Should we have not taken that commit?
> > > > 
> > > > Yep, that's just a mistake on our (my) part; you should have taken
> > > > that commit, and my thanks for taking it without asking us.
> > > > 
> > > > That being said, maybe one path forward is that the stable team
> > > > *should* be asking the subsystem maintainers about.  "Hey, the
> > > > following commits appear to be backported, but you didn't add a cc:
> > > > stable.  We plan to backport them unless you complain."  This has the
> > > > benefit of giving feedback to the subsystem maintainers that they they
> > > > missed tagging some number of commits, which might remind them to do
> > > > better, or make them decide that they want to do something more
> > > > explicit, such as have their own stable backports initiative ala XFS.
> > > > 
> > > > More generally, it seems to me that we are conflating multiple issues
> > > > here in this discussion which may be making it harder for us make
> > > > progress on the question.
> > > > 
> > > > 1) There are some subsystems who don't care about tagging commits,
> > > >    either Fixes: or Cc: stable, or both;
> > > > 
> > > > 2) There are subsystems which are trying to appropriately tag commits, but:
> > > >    a) Sometimes they will make a mistake, and forget to cc: stable
> > > >    b) Sometimes it's too hard (tm) to figure out what is the commit which
> > > >       introduces the regression, so they either make up something (e.g.,
> > > >       hmm, it looks like commit XYZ changes one of the line that is touched
> > > >       by the patch, so <shrug emoji>), or they will add a Cc: stable but
> > > >       not supply a Fixes: tag
> > > 
> > > Too hard doesn't work as an excuse because someone has to figure it out,
> > > and it may as well be the subsystem expert.
> > > 
> > > I've already added a checkpatch warning when people CC stable but don't
> > > include a Fixes tag.  I also plan to start going back to maintainers
> > > and manually asking them for Fixes tags.  This will be attached to the
> > > patch.msgid.link URL so the stable tooling can pick up Fixes tags which
> > > are added later.
> > > 
> > > The one question I have is for patches which pre-date git.  I was told
> > > to leave the Fixes tag off in that case, but I think that's out of date.
> > > It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")".
> > 
> > If a thing was there since before git and only now is being discovered
> > it either needs to be explicitly marked for stable with cc: or we can
> > just keep the fix in newer kernels. IMO this particular "Fixes" tag does
> > not bring any value.
> 
> On the contrary, if I see just a "cc: stable" and no "Fixes:" tag, I do
> a "best effort" to backport to all current stable/lts trees.  If it
> fails on 5.15 and older, great, I don't warn anyone about that as there
> was no Fixes: tag for me to know how far back it should go.

That's what I expected for the cases I put only Cc-to-stable; they
have been mostly some trivial quirks only for new devices, and the
stuff that can be taken safely when applicable -- otherwise just
skip.


thanks,

Takashi

