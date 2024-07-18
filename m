Return-Path: <ksummit+bounces-1443-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A789348ED
	for <lists@lfdr.de>; Thu, 18 Jul 2024 09:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40536283572
	for <lists@lfdr.de>; Thu, 18 Jul 2024 07:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B649378C70;
	Thu, 18 Jul 2024 07:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UYkRvcaQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Ytb7zwf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UYkRvcaQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Ytb7zwf"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8217D3F0
	for <ksummit@lists.linux.dev>; Thu, 18 Jul 2024 07:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721288014; cv=none; b=C1E41jhjyUSxcMp8/HIGZSfSogGQdrjnI7kPllz6dK4NhRhVgxKdQtL0OIxBFX+bRGlHNOYADIgrL2XoVv/hGM2BXpri6jD0SB9Wp5Qnq3fo5Or91SJ2i6S4FxmpwiegPyOA+j9D03BXO6Y4EMcdOBKZabcB/pjv9sof2eH0HW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721288014; c=relaxed/simple;
	bh=Je/oOlNVH0dai0EZE6UsIKxcMv1A0F5OijtL1gqLANM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDZkjjdH/eISSukKpFgWIVbNu/6u6lTz8AV1V6cg2iYaxTYZ/CMWI5hsi34TGWW+0g9lk2gnwUeorMlBlJe6u/svQN15RFMNW/bPki4gQYEQqVfTV0Su9EfA8EI0Wtt3qy7KdBO6TL4gIR4wDDGoC+iaZI1EkY/UGE2IUARE6p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UYkRvcaQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Ytb7zwf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UYkRvcaQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Ytb7zwf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 892901F8B0;
	Thu, 18 Jul 2024 07:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721288010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DbD2QSEftrBes9Z78JXZa20iBTcBkcpUCpxnIiH66yM=;
	b=UYkRvcaQL0W0mdwjz25nn72AViY+sunuMJCBXq8GompNw/VLXykvMYPjHwB1HyQ5dpyrwZ
	MWb9MBfhrtNZeOTDdH+IBYMamGhFOKhllNAyPMfCVlH29t8bkETXuYZTxBuGBzkgDbZCHN
	nv7tFqpNyWSOBmy/QbtFwt7m3QaKvpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721288010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DbD2QSEftrBes9Z78JXZa20iBTcBkcpUCpxnIiH66yM=;
	b=5Ytb7zwf0NuL3qdIaUcpuq48TQT97hleHPyysZBwUeLHdozu3+1xsYsO/+31CjU8l/Qfvw
	zYZSAhAroVhA9nBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UYkRvcaQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5Ytb7zwf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721288010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DbD2QSEftrBes9Z78JXZa20iBTcBkcpUCpxnIiH66yM=;
	b=UYkRvcaQL0W0mdwjz25nn72AViY+sunuMJCBXq8GompNw/VLXykvMYPjHwB1HyQ5dpyrwZ
	MWb9MBfhrtNZeOTDdH+IBYMamGhFOKhllNAyPMfCVlH29t8bkETXuYZTxBuGBzkgDbZCHN
	nv7tFqpNyWSOBmy/QbtFwt7m3QaKvpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721288010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DbD2QSEftrBes9Z78JXZa20iBTcBkcpUCpxnIiH66yM=;
	b=5Ytb7zwf0NuL3qdIaUcpuq48TQT97hleHPyysZBwUeLHdozu3+1xsYsO/+31CjU8l/Qfvw
	zYZSAhAroVhA9nBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 479201379D;
	Thu, 18 Jul 2024 07:33:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bsDND0rFmGa+EgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Jul 2024 07:33:30 +0000
Date: Thu, 18 Jul 2024 09:34:04 +0200
Message-ID: <87v813w3v7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Greg KH <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Sasha Levin <sashal@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
In-Reply-To: <ad9720d8-6b4e-4f7c-bf72-b3c2db8887d4@suswa.mountain>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	<915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
	<ZpQbQa-_8GkoiPhE@sashalap>
	<f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
	<ZpQyeLFJY1gJvRRA@sashalap>
	<20240715180000.GC70013@mit.edu>
	<fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
	<ZpWK0m7Ps6Y4vjL2@google.com>
	<2024071605-bulb-plop-9cea@gregkh>
	<87frs91qat.wl-tiwai@suse.de>
	<ad9720d8-6b4e-4f7c-bf72-b3c2db8887d4@suswa.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 892901F8B0
X-Spam-Flag: NO
X-Spam-Score: 0.99
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.99 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,linuxfoundation.org,gmail.com,mit.edu,kernel.org,hansenpartnership.com,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spamd-Bar: /

On Thu, 18 Jul 2024 00:05:06 +0200,
Dan Carpenter wrote:
> 
> On Tue, Jul 16, 2024 at 02:20:42PM +0200, Takashi Iwai wrote:
> > > > > The one question I have is for patches which pre-date git.  I was told
> > > > > to leave the Fixes tag off in that case, but I think that's out of date.
> > > > > It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")".
> > > > 
> > > > If a thing was there since before git and only now is being discovered
> > > > it either needs to be explicitly marked for stable with cc: or we can
> > > > just keep the fix in newer kernels. IMO this particular "Fixes" tag does
> > > > not bring any value.
> > > 
> > > On the contrary, if I see just a "cc: stable" and no "Fixes:" tag, I do
> > > a "best effort" to backport to all current stable/lts trees.  If it
> > > fails on 5.15 and older, great, I don't warn anyone about that as there
> > > was no Fixes: tag for me to know how far back it should go.
> > 
> > That's what I expected for the cases I put only Cc-to-stable; they
> > have been mostly some trivial quirks only for new devices, and the
> > stuff that can be taken safely when applicable -- otherwise just
> > skip.
> > 
> 
> That's the same thing that happens if you add the Fixes: 1da177e4c3f4
> ("Linux-2.6.12-rc2") tag.  Greg and Sasha aren't manually backporting
> patches unless they seem security related.  When a patch doesn't
> backport cleanly, the stable maintainers rely on other people to backport
> patches they care about.

Well, in my case, it's not always Fixes:Linux-2.6.12-rc2; the relevant
code has been often added later.  But pointing somewhere new as Fixes
also won't work, since there are other dependent fixes.  And tracking
all those is really hard, and not worthy.  It's a thing that can be
backported safely whenever it's cleanly applied and built, but
otherwise it can be simply skipped.  It's no "regression", per se, but
a new feature that didn't exist in the past, after all.

That said, if a change is important and should be inevitably
backported to stable, I'd point Fixes tag, too.


thanks,

Takashi

