Return-Path: <ksummit+bounces-1272-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A232F908DAD
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3A741C225F3
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650ADEAF0;
	Fri, 14 Jun 2024 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="M2+/ZYY2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="N8ssExLr";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="M2+/ZYY2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="N8ssExLr"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F250F503
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718376119; cv=none; b=DmsNGcJBjrBVA1OfNUQpephXJto6nXljVNHG5cG9z+rcqF7TXzIYVLfEL3yrJX1fWHvbdUwfw0Wy1OKza/LOhqgZ8wsyowt382qM/Ds1Y2nbS2NRDRvhBVyDT9iJfpmeu7zMyo90oGRIRUfdfnKIY+841Jn3oxoFi0cRT+H/Hsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718376119; c=relaxed/simple;
	bh=eHMPIJIxU7Heuv9sMsKXSrH2E954DqFRkGSdlInIePE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RE15+KD92Fv5rPQsuJCcvj8x0W4KN51bIbNpQ5nLffqjCsa0wl6Kusmj0lsEbv+67uXG2Z8cY+ZNZZmpTNOZkorg80Cdk19M8RB4f0buMttVX6TdrFrVrRxnzlrEjjPl70n/4L5BTDZ/bZ8Mp3RQeH/h3Y/S6ozT2Jw0zmwrYCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=M2+/ZYY2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=N8ssExLr; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=M2+/ZYY2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=N8ssExLr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5BBC3205D2;
	Fri, 14 Jun 2024 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1718376116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lngW1y/BRDUhjqmNfwL+6sYBVa61lPKABgZmZNLm/AA=;
	b=M2+/ZYY2GUaGtkJiHJGCISs6DIsU2ivxcqkcd0edZpti3lZgub1pKoDdfez42cF8+fwIg1
	3nwFgv9DY83QCPGf4luP3ZxzUsHHwjoPcmZzLkLF4s0CnyPQmQ6Xa1P+oXQjKJ/DczcI0X
	9Kg8f6yxZFd/sWQG2982vyZpeao6E3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1718376116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lngW1y/BRDUhjqmNfwL+6sYBVa61lPKABgZmZNLm/AA=;
	b=N8ssExLrHhg0lwJb8JEsp59/3FpU46BXd8zvLbgbrF1IkkFJF5WXkHS8+b+a0ZQNchcMXn
	ossKDJwDdsMA3mAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="M2+/ZYY2";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=N8ssExLr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1718376116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lngW1y/BRDUhjqmNfwL+6sYBVa61lPKABgZmZNLm/AA=;
	b=M2+/ZYY2GUaGtkJiHJGCISs6DIsU2ivxcqkcd0edZpti3lZgub1pKoDdfez42cF8+fwIg1
	3nwFgv9DY83QCPGf4luP3ZxzUsHHwjoPcmZzLkLF4s0CnyPQmQ6Xa1P+oXQjKJ/DczcI0X
	9Kg8f6yxZFd/sWQG2982vyZpeao6E3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1718376116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lngW1y/BRDUhjqmNfwL+6sYBVa61lPKABgZmZNLm/AA=;
	b=N8ssExLrHhg0lwJb8JEsp59/3FpU46BXd8zvLbgbrF1IkkFJF5WXkHS8+b+a0ZQNchcMXn
	ossKDJwDdsMA3mAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F36E13AAF;
	Fri, 14 Jun 2024 14:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ordVE7RWbGYGVAAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 14 Jun 2024 14:41:56 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id D7441A0870; Fri, 14 Jun 2024 16:41:51 +0200 (CEST)
Date: Fri, 14 Jun 2024 16:41:51 +0200
From: Jan Kara <jack@suse.cz>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240614144151.jun62q24lki5aqhj@quack3>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <0db30bc4-b646-43ec-bc0c-3b8b1372799d@lunn.ch>
 <Zms3F12AXGhErOrV@sashalap>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zms3F12AXGhErOrV@sashalap>
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5BBC3205D2
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Spam-Level: 

On Thu 13-06-24 14:14:47, Sasha Levin wrote:
> On Thu, Jun 13, 2024 at 04:28:47PM +0200, Andrew Lunn wrote:
> > > * One cause of regressions that happen in stable trees (and not in
> > > mainline) I've seen quite a few times are backports of commits with
> > > Fixes: tags that were part of a patch-series and depend on earlier
> > > patches from the series. The stable-team afaics has no easy way to spot
> > > this, as there is no way to check "was this change part of a series".
> > 
> > This sounds like a tooling issue. git send-email knows a patch is part
> > of a patch series. Maybe it should be adding some sort of cross
> > reference between patches in a patch series.
> 
> This came up in the past, and we have some machinery to check if a
> commit is part of a series or not, but in practice most of the series we
> see are actually not ones where patches depend on each other.

I'm not sure I understand. Do you say most of the fixes you apply are
from single-patch series? Or if the series has multiple patches, how do you
decide whether some patch depends on other ones in the series or not?
Because judging that sometimes requires rather detailed knowledge of the
involved subsystem...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

