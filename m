Return-Path: <ksummit+bounces-2090-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B658B1C100
	for <lists@lfdr.de>; Wed,  6 Aug 2025 09:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB649183AC1
	for <lists@lfdr.de>; Wed,  6 Aug 2025 07:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7D8217F27;
	Wed,  6 Aug 2025 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kNKByGvg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HWLDielw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kNKByGvg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HWLDielw"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E13B217719
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 07:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754464093; cv=none; b=H/8iay5GVpmIy9fc3HREfyY0FcVU6/P5k77VQ/oMZFvJq9hGVwN0IRarmRsdGanFSpMGQUlsi+LoCnRuuZwDgRqIAMuY7RDN9hgz944cGwPUqgobORDZ62QjD2DkO7zM1SkjAAOqUw4AYFEuCLRwdj62l7hhbO4qALsJUTxZMnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754464093; c=relaxed/simple;
	bh=Wmn+FMwP/OgoPTHA3q5RDQzbKMx16H0imuh9fP5iZS0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ojgaGuV8EEiB5DJAUY8oh2Jpc6C4lVybtRKQ8YPsRKhyAA4/8X2zfqVLfocdgolQDQ8b8yPtZUZm3iqZsdpwjA8ZJfF/gg6DLDNAkYp6j/3AjkcqYcmqMjBHpSb5sYH/x0bdHLzRTdTUdo8QFPZYYjenN0NWYD3Kwo0za0uCMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kNKByGvg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HWLDielw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kNKByGvg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HWLDielw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 67F541F394;
	Wed,  6 Aug 2025 07:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754464089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2rhBJ1kp7fd4oel1L0KlqnUxnD44GRcu9O7DVDbQXYA=;
	b=kNKByGvgxFse1VoXy0V5wrWrAMrIe/VpaB7SQecPNBoa7OTbkNBffVmo1wKxBfMAJxZuZ4
	4h9ZF3J3dtzj2In9/5hBUCZL5uJjVVVhldV6GaY1SrniHm5dOj8YH6U9CpyJPs3GKuCgNo
	sdqKHDJSISNjLvDdOP6xSlYKHPbPBqk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754464089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2rhBJ1kp7fd4oel1L0KlqnUxnD44GRcu9O7DVDbQXYA=;
	b=HWLDielwQ6zEknTyNW6Y8ieCcq3zfumi1mdidO6KQSzum2XdMKyfrd4nE8IrVuZFrOTuug
	rrUAuuqsRqdlkmBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kNKByGvg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HWLDielw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754464089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2rhBJ1kp7fd4oel1L0KlqnUxnD44GRcu9O7DVDbQXYA=;
	b=kNKByGvgxFse1VoXy0V5wrWrAMrIe/VpaB7SQecPNBoa7OTbkNBffVmo1wKxBfMAJxZuZ4
	4h9ZF3J3dtzj2In9/5hBUCZL5uJjVVVhldV6GaY1SrniHm5dOj8YH6U9CpyJPs3GKuCgNo
	sdqKHDJSISNjLvDdOP6xSlYKHPbPBqk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754464089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2rhBJ1kp7fd4oel1L0KlqnUxnD44GRcu9O7DVDbQXYA=;
	b=HWLDielwQ6zEknTyNW6Y8ieCcq3zfumi1mdidO6KQSzum2XdMKyfrd4nE8IrVuZFrOTuug
	rrUAuuqsRqdlkmBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39E5C13AA8;
	Wed,  6 Aug 2025 07:08:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sVWnDFn/kmiQbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 07:08:09 +0000
Date: Wed, 06 Aug 2025 09:08:08 +0200
Message-ID: <878qjxrkpz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jiri Kosina <jikos@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Greg KH <gregkh@linuxfoundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
In-Reply-To: <234rn3r2-qss4-s6s4-8o69-81o79rqp9s54@xreary.bet>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
	<cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com>
	<2025080515-grandpa-prankster-ee83@gregkh>
	<p1886464-9p9n-4p0r-52r7-70sqprsoo32q@xreary.bet>
	<87ectprmmg.wl-tiwai@suse.de>
	<234rn3r2-qss4-s6s4-8o69-81o79rqp9s54@xreary.bet>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 67F541F394
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.51

On Wed, 06 Aug 2025 09:00:49 +0200,
Jiri Kosina wrote:
> 
> On Wed, 6 Aug 2025, Takashi Iwai wrote:
> 
> > > The question is whether it's really worth all the e-mail traffic this 
> > > is generating, if people are just filtering those away.
> > > 
> > > For context searches if some particular information regarding stable 
> > > patch history is needed, we can still do lore/lei queries nicely and 
> > > easily. Is there any other usecase (that people are actually actively 
> > > using) for it?
> > 
> > In rare cases, patches are incorrectly applied.  That can't be
> > verified without the actual patch.
> > 
> > Usually it happens with a cherry-pick with fuzz, so we might be able
> > to catch suspected ones, but the inspection of the patch is still
> > needed.
> 
> Sure, but you have to do that pro-actively (in case you care in the first 
> place, of course). Doesn't then lore/lei provide you with the equal 
> functionality?

Yeah, that's possible.  It'll become a question of tooling, after
all.  The digest mail could list up the commits that couldn't be
applied without fuzz, then one can fetch and verify, too.


Takashi

