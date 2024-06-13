Return-Path: <ksummit+bounces-1235-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58F9906984
	for <lists@lfdr.de>; Thu, 13 Jun 2024 11:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 296F12853DE
	for <lists@lfdr.de>; Thu, 13 Jun 2024 09:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9201420B3;
	Thu, 13 Jun 2024 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="kAfoqNFh";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9fvWneIR";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="kAfoqNFh";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9fvWneIR"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6C81411FD
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272762; cv=none; b=MfpIDH+IGHiciipFl9AIXBBlY6lNtnHVKpuS7sA/qbfXkwCV83v5nm0aWLwuVBoq5o5R/so+Wh4ooLuzII2HklpKuxZNJGC40tfQz5YpU1PLtKOGm3D2AayrLu2l8D+e9eU7BQA5Afi8SCTkjktpAS0Ej+IlifA8F6yMLE7v4fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272762; c=relaxed/simple;
	bh=O31Iu5Lvokfz2VgFLA5PJrPQ+UVhWyFD8GJJHs9cOk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVDIGAOMGEwltHukqITcThmlSh6lH8ryMMdrfl7x4elfEYorbokiv2yzu3vkK7zIZ4iwlACnacH2It+EOUvi7OV+wTIbXNGiIhZCvS/JigHyKfoxiuk6pPe+4Xg5bI+87X41VxtVefgB57HzsPfqoSkjEibpz1RVlUQ/ZZyoZ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=kAfoqNFh; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9fvWneIR; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=kAfoqNFh; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9fvWneIR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4EA265D133;
	Thu, 13 Jun 2024 09:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1718272758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zite7KjVNnX2bEh4S4J9IWU9VzCxq49lymlIrlt8pME=;
	b=kAfoqNFhu6lRES0JaXUCHWrC4+SppKNfyFHETosu2mpxjgHDK2CXB3gqMMsqxzWWx/hpMd
	n89GwXOrQWS9F/8wl8Bqm+OIGADaIxxY62K6XGZvZnhKfDjAT2F+7gW4H/+fd9nGHwzv8l
	qAgpqOpK4CILZ3utXZax6Jhq2Rpads4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1718272758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zite7KjVNnX2bEh4S4J9IWU9VzCxq49lymlIrlt8pME=;
	b=9fvWneIRuEHrol/yUmZAdXpOTMVgJvVs/I6rGLHLurfCzpEJG8Aqy0YxSh4wQRb8sqSCTg
	dXiRpkNjq3BiBNDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=kAfoqNFh;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=9fvWneIR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1718272758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zite7KjVNnX2bEh4S4J9IWU9VzCxq49lymlIrlt8pME=;
	b=kAfoqNFhu6lRES0JaXUCHWrC4+SppKNfyFHETosu2mpxjgHDK2CXB3gqMMsqxzWWx/hpMd
	n89GwXOrQWS9F/8wl8Bqm+OIGADaIxxY62K6XGZvZnhKfDjAT2F+7gW4H/+fd9nGHwzv8l
	qAgpqOpK4CILZ3utXZax6Jhq2Rpads4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1718272758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zite7KjVNnX2bEh4S4J9IWU9VzCxq49lymlIrlt8pME=;
	b=9fvWneIRuEHrol/yUmZAdXpOTMVgJvVs/I6rGLHLurfCzpEJG8Aqy0YxSh4wQRb8sqSCTg
	dXiRpkNjq3BiBNDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4479B13A87;
	Thu, 13 Jun 2024 09:59:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aNCwEPbCamZ3eAAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 13 Jun 2024 09:59:18 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id E0619A087B; Thu, 13 Jun 2024 11:59:17 +0200 (CEST)
Date: Thu, 13 Jun 2024 11:59:17 +0200
From: Jan Kara <jack@suse.cz>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240613095917.eeplayyfvl6un56y@quack3>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4EA265D133
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Spam-Level: 

On Thu 13-06-24 10:42:01, Thorsten Leemhuis wrote:
> * One cause of regressions that happen in stable trees (and not in
> mainline) I've seen quite a few times are backports of commits with
> Fixes: tags that were part of a patch-series and depend on earlier
> patches from the series. The stable-team afaics has no easy way to spot
> this, as there is no way to check "was this change part of a series".
> Sometimes I wonder if a dedicated tag linking to the submission of a
> patch could help -- and is something quite a few maintainers already
> really want and add using a "Link" tag despite Linus dislike for that
> (IIRC).

FWIW I (and a few other maintainers) use 'Message-Id' tag to link to
submission. This is still easily convertible to lore link and unlike 'Link'
tag it is clear what this tag is about and that it is not just a link to
related discussion or something like that. AFAIK this also addresses Linus'
dislike because what he was complaining about is that 'Link' should be
linking to some useful context for the changelog, not just patch
submission.

> But following that link for each and every patch slated for
> backporting does not scale for the stable team anyway, so it's likely
> not worth it.

Well, what I'd propose is that if 'Message-Id' tag is present and thus it
can be established (in an automated way using lore) which series this patch
was part of, then stable maintainers will either pick all patches from the
start of the series upto this change or nothing. Because what I see
happening several times in a year just in subsystems I maintain is that
stable tree picks up more or less random subset of a patch series
(depending on what applies and what their algorithms decide to take) and
that causes issues. Sometimes we catch that during glancing over patches
flowing into stable (like Amir did last week) but sometimes we don't and
breakage happens.

This will require a bit more discipline when creating patch series to put
more or less independent fixes that should go into stable first but that is
a good practice anyway and mostly followed at least in the areas of the
kernel I work in.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

