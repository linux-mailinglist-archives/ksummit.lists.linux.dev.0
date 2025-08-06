Return-Path: <ksummit+bounces-2087-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20986B1C068
	for <lists@lfdr.de>; Wed,  6 Aug 2025 08:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCDAD18A0420
	for <lists@lfdr.de>; Wed,  6 Aug 2025 06:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD05205E2F;
	Wed,  6 Aug 2025 06:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TYkrg34w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J9uYFkvE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OM8khHqi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zfr1ufai"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A561DAC95
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754461627; cv=none; b=TfD6zcQK/BaQs00wgLLxnJHXSKvLeDD6161m7ny7MbBnONZ9TQgtLnv8OJ+IBmKNQ4Y7wBXVRyysTp/pNDFnTtvcFwk6hlduUaBG7JLUSeaUqzA0y7PtNRxjOCYaIYiPs3Xz4HmkRnk6HANvaCKYy0L6P5JsoV1fAnHnHEW3RzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754461627; c=relaxed/simple;
	bh=J5MvxOu6GXmps628AZtgk1l0NLljH7C3423d8uBYFtE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oJ9SEKTlx08xqsDD6FjrIKtZRaVTQWi152OrylE2aRzvgzuMq3Np0osuSmd5ZOkSh8BgGrciz5cN3+F2P0B7t6V4s8E/u68f5Yz1DGB81fPRjuqHjmZdgVdG/6yfHnFpgy1s2iAPa5+7AYxDfmvN852yw5admLM57u02ouC6XJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TYkrg34w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J9uYFkvE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OM8khHqi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zfr1ufai; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E1F441F444;
	Wed,  6 Aug 2025 06:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754461624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLsdgpElcWflWYFzItBDCfLJwwFbvJZI6lIV5C1fGdA=;
	b=TYkrg34wC8x9dJHPW68Ztv0dfoVS5PZtcQ+uRbYem4L/LykzQsUEWYtClS3H0XT+Gm3KuZ
	pEozfT3snGdEA7Y+1WmPGbjuJry6iMtOcLDC4IEewf5WDdmJANCWtu75Nhgo4Xn+xhhgQu
	CNYUePlzX/6ogoHuwTdaJ3K/rj6J1g0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754461624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLsdgpElcWflWYFzItBDCfLJwwFbvJZI6lIV5C1fGdA=;
	b=J9uYFkvEbrDhiYHa44oV0zf12KLhNDSPmjvfDJ8Fp/8x7SLIM/Z2RNaHDJj9v2n8Q/Ej/m
	zH56NKnVkPeT40Bg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OM8khHqi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zfr1ufai
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754461623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLsdgpElcWflWYFzItBDCfLJwwFbvJZI6lIV5C1fGdA=;
	b=OM8khHqiEJsTclXvrek++M+kfVC0zBqu3S9JpeAOqp17+nBbEj9VpsAs2hIyxHWHL1FkkG
	uvOoLWI0xKGbT+hS7jHIUvxdH9NafpfBOvxdPqQpy7yXoauX92znYusbINzErUeno0Iznu
	D9b8Kd/D3mMqXAbHHGiswd9vYmENCls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754461623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLsdgpElcWflWYFzItBDCfLJwwFbvJZI6lIV5C1fGdA=;
	b=zfr1ufaiQ2JOvaPMcnXV8wFPxgzugtGbCQbegxmSyBABROwbk4WODE+JlY5QKZ+oxPwtKf
	SREvSPkAGQrtreBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2E8C13AB5;
	Wed,  6 Aug 2025 06:27:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6P2jJrf1kmi0YQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 06:27:03 +0000
Date: Wed, 06 Aug 2025 08:27:03 +0200
Message-ID: <87ectprmmg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jiri Kosina <jikos@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
In-Reply-To: <p1886464-9p9n-4p0r-52r7-70sqprsoo32q@xreary.bet>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
	<cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com>
	<2025080515-grandpa-prankster-ee83@gregkh>
	<p1886464-9p9n-4p0r-52r7-70sqprsoo32q@xreary.bet>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: E1F441F444
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Tue, 05 Aug 2025 23:39:58 +0200,
Jiri Kosina wrote:
> 
> On Tue, 5 Aug 2025, Greg KH wrote:
> 
> > > > This proposal is coming as a followup to the brief IRC discussion
> > > > that happened a few months back.
> > > > 
> > > > The amount of e-mails that are coming (with maintainers directly
> > > > CCed) as a result of patches being merged to -stable is so
> > > > overwhelming that I am not sure that people are making any productive
> > > > use of it whatsoever.
> > > > 
> > > > I am personally pretty much ignoring most of it, as (a) I wouldn't
> > > > have time to do anything else otherwise (b) I don't have a sufficient
> > > > motivation / time to invest effort into stable in the fist place.
> > > > 
> > > > I feel it'd be beneficial to discuss this, and (depending on the
> > > > outcome)perhaps make it opt-in (or opt-out) at least, with
> > > > people/subsystems  having means how to be excluded from all that ...
> > > > ?
> > > 
> > > Actually, if stable emails just had a header tag, it would be easy for
> > > procmail to sort them out ... which is what I've been asking for for
> > > years.  X-Stable-Base: and X-Stable: seem to be reasonably common and
> > > catch most of it, but codifying the use in the kernel documentation and
> > > using them consistently would really help.
> > 
> > These "a patch has been added to the stable queue" has had the following
> > X- tags on them since August 2023:
> > 
> > 	X-stable: commit
> > 	X-Patchwork-Hint: ignore
> > 
> > and I'm sure I only added that because you, or someone else, asked :)
> > 
> > You can also filter on stable-commits@vger.kernel.org, which is what I
> > do locally.
> > 
> > So filter away!
> 
> The question is whether it's really worth all the e-mail traffic this is 
> generating, if people are just filtering those away.
> 
> For context searches if some particular information regarding stable 
> patch history is needed, we can still do lore/lei queries nicely and 
> easily.
> Is there any other usecase (that people are actually actively using) for 
> it?

In rare cases, patches are incorrectly applied.  That can't be
verified without the actual patch.

Usually it happens with a cherry-pick with fuzz, so we might be able
to catch suspected ones, but the inspection of the patch is still
needed.


Takashi

