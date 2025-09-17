Return-Path: <ksummit+bounces-2405-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DBAB7E687
	for <lists@lfdr.de>; Wed, 17 Sep 2025 14:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5AB0462AE6
	for <lists@lfdr.de>; Wed, 17 Sep 2025 07:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A792F6598;
	Wed, 17 Sep 2025 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bIAQ4NgD";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kkGuxlbA";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bIAQ4NgD";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kkGuxlbA"
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577722F5495
	for <ksummit@lists.linux.dev>; Wed, 17 Sep 2025 07:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758095958; cv=none; b=lanamRbAaSL5cQRqHG9xTkPuQW3TdDaZzROZzV3dHNlSfuO1q/0h0e775i6c78PuJljAhazXnqJmHn/32B9zcwGQh/O9eP0Jx2zDkUy9NYczM/M+FfXq2UJYmLDxr4f5jf3JetPt4inQjlPHiUimGWcJ+2uL054Ib1JrSIxibhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758095958; c=relaxed/simple;
	bh=rcoIKjbIF+szMoEMde5MdtLQaZCA0aq0r1djAlg9QFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDIUlyEL454PdKxWyC/NMuNuUXbSPZ84VguTiGStfd238zHyTpD28y6tGDe5PNJ3JO0K49zbZm4CWe38AxVCs0H5PrhGFQjZl0xx/an5h3cxQN1OVLoTrvWCzzf9QxUvP1lMtbBHzE3NQ+dsyDesIGleYYpVPJHB/LwwUz03bOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bIAQ4NgD; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kkGuxlbA; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bIAQ4NgD; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kkGuxlbA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C52221FF7;
	Wed, 17 Sep 2025 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1758095954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jXFWUt8ZvHwyn6QoeNThxeBfsasIKKD+k0ooV30jZI=;
	b=bIAQ4NgDvNn7hZDprgZF9VkWmGY/dcIZ+ISOw3pnX3IQ6LkNbLNEEmDa+GYdtz9ASWNcEC
	kURN8HLSVpjQFTVnHLe03NZPekM1oVLy4qKDVTnuHseCeQ1Ofgak8txTO66Z4cOaKaFMX8
	NlWJ/JkONLC+MAxwBD+2dN1xWaFRmms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1758095954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jXFWUt8ZvHwyn6QoeNThxeBfsasIKKD+k0ooV30jZI=;
	b=kkGuxlbAAe2eLjOHCJF7UMFx1aPNMwVjwmxgOawN2aBE0WYPaqp5XR+qRz/Q188zCMzDEg
	ANdpmSfMMpp9xgBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1758095954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jXFWUt8ZvHwyn6QoeNThxeBfsasIKKD+k0ooV30jZI=;
	b=bIAQ4NgDvNn7hZDprgZF9VkWmGY/dcIZ+ISOw3pnX3IQ6LkNbLNEEmDa+GYdtz9ASWNcEC
	kURN8HLSVpjQFTVnHLe03NZPekM1oVLy4qKDVTnuHseCeQ1Ofgak8txTO66Z4cOaKaFMX8
	NlWJ/JkONLC+MAxwBD+2dN1xWaFRmms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1758095954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jXFWUt8ZvHwyn6QoeNThxeBfsasIKKD+k0ooV30jZI=;
	b=kkGuxlbAAe2eLjOHCJF7UMFx1aPNMwVjwmxgOawN2aBE0WYPaqp5XR+qRz/Q188zCMzDEg
	ANdpmSfMMpp9xgBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38227137C3;
	Wed, 17 Sep 2025 07:59:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vvGwDVJqymiFewAAD6G6ig
	(envelope-from <jack@suse.cz>); Wed, 17 Sep 2025 07:59:14 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id E4AEFA0A95; Wed, 17 Sep 2025 09:59:09 +0200 (CEST)
Date: Wed, 17 Sep 2025 09:59:09 +0200
From: Jan Kara <jack@suse.cz>
To: Coly Li <colyli@fnnas.com>
Cc: Paul Moore <paul@paul-moore.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Jan Kara <jack@suse.cz>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] re-think of richACLs in AI/LLM era
Message-ID: <3kyvpf23r3bgnuwxl2wuan64dfuahnarpzzsn2gxae3hylsva6@gcf4moh5zvol>
References: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com>
 <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl>
 <20250908113934.1a31423a@gandalf.local.home>
 <E5FD7630-3474-4F02-A4F8-A1C11DA7672A@fnnas.com>
 <4f2d4025-9fbf-441d-a51a-0c0d4ba16314@infradead.org>
 <CAHC9VhRyRuBtzwn2LbwxqLvj21LwrwrAZx4N3f7At1HHyNFPCQ@mail.gmail.com>
 <yiqw4rfqbry7s34af72eoemon2qbylc6prouafg7xx3aeo2uwa@tdgyedc43hhp>
 <CAHC9VhR0RU+AfhJEZnA2=7CSZhWYTMB5CdbE9BfGoTbYBP9Rnw@mail.gmail.com>
 <s5e5xf2f4svjc6wd6rn6t2h3nxt2egrn63zqx7tfe4ch3rhuc7@vganh63433hd>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5e5xf2f4svjc6wd6rn6t2h3nxt2egrn63zqx7tfe4ch3rhuc7@vganh63433hd>
X-Spamd-Result: default: False [-3.78 / 50.00];
	BAYES_HAM(-2.98)[99.91%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_THREE(0.00)[3];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.78

On Wed 17-09-25 01:12:48, Coly Li wrote:
> Users store they photos on the system, and the compact AI module processes all
> their photos and groups all the photos into different categories like pizza,
> dogs, cats, foods or group photos. After the process done, users may see they
> photos in different categories that the AI module thinks they should be in. Then
> users may share the categories with photos to others. If indentical categories
> shared by different users, the shared photos can be combined all together. And
> AI module may continue to process the shared photos and generate new categaries
> from the shared photos, e.g. pizza in the same city, cats and dogs in closed
> location, group photos contains the most common people, etc. Now the differet
> categories are implemented by different directories in the publicly shared
> directory.
> 
> In each category directory, photos with a category (or attribution) can be
> accessed as hard links to the original photo inodes and share the identical
> inodes. All these category directories are created by the AI module, although
> the photos are shared from each users. If a user is identified from a group
> photo, and this user is noticed that the photo is publicly shared. If this user
> doesn't want his face to be shared in public, for an optinal privacy protection
> right, this user can remove the hardlink of the photo which his or her face is
> in, that is he or she can remove the hardlink (dentry) under a publicly shared
> directory which this user doesn't have write permission. Because this user can
> be idnetified as owner of his or her face, and the photo has his face in, he or
> she should have write permission to delete the photo, but no write permission to
> other photos in same category directioy which his or her face is not in.

Well, from what you describe I'd say that the category directories should
just be AI owned rwxrwxrwt dirs (do notice the sticky bit set). This is how
/tmp/ is usually setup. This means that everybody can read the dir,
everybody can delete files but only if they are their owner, everybody can
create files - this is the part you probably don't want but *that* is
pretty easy to restrict by a LSM (practically any one can do this).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

