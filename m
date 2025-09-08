Return-Path: <ksummit+bounces-2300-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A3B48A8C
	for <lists@lfdr.de>; Mon,  8 Sep 2025 12:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 474163417AA
	for <lists@lfdr.de>; Mon,  8 Sep 2025 10:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F012E22256F;
	Mon,  8 Sep 2025 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="0Xryq92F";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ThM/8baB";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="0Xryq92F";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ThM/8baB"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CDD21FF5D
	for <ksummit@lists.linux.dev>; Mon,  8 Sep 2025 10:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328773; cv=none; b=AJiyVcf6BPQhDWK9WhrlX1MQgGpbNm4VhKVzXphJx+pvP+DCqKjfn0htwmblCJZEX9n15BCmDrqsImEbXZ007+CbgYpS+vwqit1eDdtao60opW8/7CnhOPhiVfPr8KAEXdIELnrFaZNcI7cgo6b7KR0rohdw2MoyWvs+hQYhIi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328773; c=relaxed/simple;
	bh=breT8TZeJ8IIR4IEjBo84Xf4AVHRsx5QSN0iE0yZNpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5bYwLfdgS1fW/E1ei+BeXETpX0WtlPTqEp0EliUN2WGV++72h2dbB0BdGbZkFcdaArBUMPrjLYoRp24DEamhK0k/Wjt8MjzgR+9T6JZR1XRRvOY2TtogjHA7Za+ADurjuvcMCp3b61gHHXN32iUhbkhZJrOmZyWoDQ5/DsHNAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=0Xryq92F; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ThM/8baB; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=0Xryq92F; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ThM/8baB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2516926A57;
	Mon,  8 Sep 2025 10:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1757328769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gKX5h0Wu/bEAXObh3Lj6umFkuP44fHdBI+QTbPNnGeM=;
	b=0Xryq92FzJEq32FzX8s5d2O1vvXQHb0z9jAD7wYIRtQ/qIX7gE7aW1ATjqrcT9wYV3u0XC
	XnbGWUdCL9l5cfOOBh2ooXJwm2ijXwgC5UnD8qlTpSi/BSaIaPWwGCLQhiXvz8h5WZo8hn
	WljAhw+2xYAmo/Si/uArTUkhEEOpmsM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1757328769;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gKX5h0Wu/bEAXObh3Lj6umFkuP44fHdBI+QTbPNnGeM=;
	b=ThM/8baBYw7NFTWrH5+QKY/1WTJhbAR5n1Y2aq1enM8uZ4+wDB/fO+ZNxdxQz29MTsgPQy
	TdFAWHuyYOYha+AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=0Xryq92F;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="ThM/8baB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1757328769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gKX5h0Wu/bEAXObh3Lj6umFkuP44fHdBI+QTbPNnGeM=;
	b=0Xryq92FzJEq32FzX8s5d2O1vvXQHb0z9jAD7wYIRtQ/qIX7gE7aW1ATjqrcT9wYV3u0XC
	XnbGWUdCL9l5cfOOBh2ooXJwm2ijXwgC5UnD8qlTpSi/BSaIaPWwGCLQhiXvz8h5WZo8hn
	WljAhw+2xYAmo/Si/uArTUkhEEOpmsM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1757328769;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gKX5h0Wu/bEAXObh3Lj6umFkuP44fHdBI+QTbPNnGeM=;
	b=ThM/8baBYw7NFTWrH5+QKY/1WTJhbAR5n1Y2aq1enM8uZ4+wDB/fO+ZNxdxQz29MTsgPQy
	TdFAWHuyYOYha+AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A24313946;
	Mon,  8 Sep 2025 10:52:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r9lfBoG1vmitBQAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 08 Sep 2025 10:52:49 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id CD773A09EB; Mon,  8 Sep 2025 12:52:48 +0200 (CEST)
Date: Mon, 8 Sep 2025 12:52:48 +0200
From: Jan Kara <jack@suse.cz>
To: Coly Li <colyli@fnnas.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] re-think of richACLs in AI/LLM era
Message-ID: <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl>
References: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com>
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2516926A57
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email];
	RCVD_COUNT_THREE(0.00)[3];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -4.01

Hi Coly!

Maintainers summit is about process issues with the Linux kernel. Your
proposal is for a technical discussion so it doesn't really fit there. More
fitting would be a Kernel summit track at LPC which is for technical
topics. Given your topic is mostly a discussion on a relatively specialized
filesystem topic, I think the best venue for this would be LSFMM summit
next spring where you get the biggest concentration of people that have
something to say to this topic. (OTOH it's going to be in Europe so I
understand the location needn't be as convenient for you as LPC).

I'm not really on program committee for either a Maintainers summit or LPC
so take this just as a friendly advice from a bystander :)

								Honza

On Mon 08-09-25 16:33:54, Coly Li wrote:
> This is Coly Li. I’ve been maintaining bcache for a while and have met Linus,
> Greg, Ted, and other maintainers in person at many conferences. Yes, I am a
> sustained and reliable kernel developer.
> 
> Recently, I joined a startup (https://fnnas.com) that provides AI/LLM
> capabilities for personal or micro-enterprise storage. We help users share and
> communicate AI/LLM-processed information from their stored data more
> conveniently.
> 
> Our users can run highly compact LLMs on their own normal and inexpensive
> hardware to process photos, videos, and documents using AI. Of course, it’s slow
> but that’s expected and acceptable. They can even come back to check the results
> weeks later.
> 
> In our use case, different people or roles store their personal and sensitive
> data in the same storage pool, with different access controls granted to AI/LLM
> processing tasks. When they share specific information or data with others
> within the same machine or over the internet, the access control hierarchy or
> rules become highly complicated and impossible to handle with POSIX ACLs.
> 
> We tried bypassing access control to user space, which worked well except for
> scalability and performance:
> - As the number and size of files increase, storing all access control rules in
>   user space memory doesn’t scale—especially on normal machines without huge
>   memory resources.
> - For some hot data sets (a group of files and directories), checking access
>   control rules in user space and hooking back to the kernel is highly
>   inefficient.
> 
> Therefore, the RichACL project comes back to mind. Of course, RichACL alone
> isn’t enough. A high-level policy agent (in user space) is still needed for
> task/session-oriented access and sharing policy control, but RichACL can help
> implement file system-level access control. This would give us a context-aware
> and highly efficient access control implementation.
> 
> What I’d like to discuss is:
> - After almost 10 years, should we reconsider RichACL in the AI/LLM era?
> - What are the major barriers or remaining work needed to get RichACLs into
>   upstream?
> 
> Since our first public beta was released 13 months ago, we now have over one-
> million active installations running daily. This is a real workload for RichACL
> and represents real feature demand from end users. If you’re interested in this
> topic, we’d be happy to provide more details about the access control
> requirements in AI workloads and even show a live demo of the use case.
> 
> Thanks in advance.
> 
> Coly Li
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

