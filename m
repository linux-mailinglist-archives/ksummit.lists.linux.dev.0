Return-Path: <ksummit+bounces-1291-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69577909C12
	for <lists@lfdr.de>; Sun, 16 Jun 2024 09:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B42EB20FC6
	for <lists@lfdr.de>; Sun, 16 Jun 2024 07:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794FF173322;
	Sun, 16 Jun 2024 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0WJzVMkh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hl61YxuR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0WJzVMkh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hl61YxuR"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D22F2B
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 07:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718522797; cv=none; b=d0gb+eVhdMRIbmQRbEx6V/whABYaVkEHkx9yo0ifPLLYGgsd5mYpV1VPIKT7+oL+Lw9LGhnEqHH6NKvGo/Y5eIKyrQm6gtIamGhCGtYCVcGdDrvWkWojSZ75/Q5XvZ0hOOpf77UNf79rzuTMRXQQMC9xoaVN6Gy0gy34/f8TGlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718522797; c=relaxed/simple;
	bh=MUNMxxMPJVSieyoa/Rjv1ModtMsUddN/BBE0crURZnE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gkMb8+V2Bt77nebkU6ZtHSJeHM4sxAZYHf4uyENMGraLuO8RTGMyVUbc55hvxIenY+YQ1/2iTzc61WhmTUQWJsIOQ/xOjw5pbs/8oeoV4ed5cIPYBQaH0eqT+kt/faO5sDQoT493GjmnPZUN5X3yC8Q063eMRIzjUs3bm7lRXwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0WJzVMkh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hl61YxuR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0WJzVMkh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hl61YxuR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 81F0A5CC95;
	Sun, 16 Jun 2024 07:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718522792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mbvu0bxnfpTrvKHxU0vZPWahsYnDUf3tqUFTw0SmGfE=;
	b=0WJzVMkhBQ7J2EADzKXMJCqQe5MKm0ssCT0xrtMcB/ERetCTin9hgLrUQhrGyaNk8Gi77e
	V/ilg31zpzH38dXrroUwMKOB8GhdnE61jgoSNei01eRdezqwZ/ozpUKR4E6vmdwYF55aVj
	czTgFyUyI4AvSn4a2x1fTapdRrt/CqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718522792;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mbvu0bxnfpTrvKHxU0vZPWahsYnDUf3tqUFTw0SmGfE=;
	b=Hl61YxuRIuW3ejIisgxyT1M9UoQ1zzhAjAk+nuTPUYugqT4BlNqBZahuJBVzjKt+clCtlf
	h3SAWYMi5ziTRuBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0WJzVMkh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Hl61YxuR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718522792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mbvu0bxnfpTrvKHxU0vZPWahsYnDUf3tqUFTw0SmGfE=;
	b=0WJzVMkhBQ7J2EADzKXMJCqQe5MKm0ssCT0xrtMcB/ERetCTin9hgLrUQhrGyaNk8Gi77e
	V/ilg31zpzH38dXrroUwMKOB8GhdnE61jgoSNei01eRdezqwZ/ozpUKR4E6vmdwYF55aVj
	czTgFyUyI4AvSn4a2x1fTapdRrt/CqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718522792;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mbvu0bxnfpTrvKHxU0vZPWahsYnDUf3tqUFTw0SmGfE=;
	b=Hl61YxuRIuW3ejIisgxyT1M9UoQ1zzhAjAk+nuTPUYugqT4BlNqBZahuJBVzjKt+clCtlf
	h3SAWYMi5ziTRuBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B89613AA0;
	Sun, 16 Jun 2024 07:26:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HhzBDKiTbmZTCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 16 Jun 2024 07:26:32 +0000
Date: Sun, 16 Jun 2024 09:26:56 +0200
Message-ID: <87ed8x5ovz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Takashi Iwai <tiwai@suse.de>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent backports of commits that turn out to cause regressions
In-Reply-To: <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	<e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
	<20240613095917.eeplayyfvl6un56y@quack3>
	<20240613-rustling-chirpy-skua-d7e6cb@meerkat>
	<87plsjoax6.fsf@mail.lhotse>
	<CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 81F0A5CC95
X-Spam-Flag: NO
X-Spam-Score: -5.51
X-Spam-Level: 

On Sun, 16 Jun 2024 03:13:57 +0200,
Linus Torvalds wrote:
> 
> On Fri, 14 Jun 2024 at 07:29, Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Message-Id: sucks, I want a link I can open with a single click.
> 
> !00% agreed.
> 
> There is no way in hell I will endorse adding more of those completely
> *idiotic* "Message-ID" things.
> 
> Yes, people use them. It's a damn shame.
> 
> There is no excuse for that completely broken model. It's objectively
> and unquestionably worse than having a "link".
> 
> Here's the thing: if that message-ID isn't public, then that line
> SHOULD NOT EXIST and is an actual real problem. I personally look at
> those, and go "is that actually available on lore?"
> 
> And if that message-id _is_ public, then it has a link, and it's much
> easier for people to check.
> 
> Ergo: there is absolutely zero reason to ever use Message-ID.
> 
> People need to stop advocating that sh*t.
> 
> And no, I'm not at all happy with the fact that apparently vhost and
> kvm has made it their thing.
> 
> Paolo, Michael, Takashi, please put useful links, not those braindead
> message id's in your commit messages.

Sorry for that.  I used to convert Message-Id to Link in the past in a
git hook, but this got broken after migrating my workstation to a new
machine, so you saw it in my previous few PRs as a side effect.
I believe it's already fixed in the last PR.


Takashi

