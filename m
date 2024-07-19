Return-Path: <ksummit+bounces-1447-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5997F93719F
	for <lists@lfdr.de>; Fri, 19 Jul 2024 02:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC6ECB215EF
	for <lists@lfdr.de>; Fri, 19 Jul 2024 00:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A8A137E;
	Fri, 19 Jul 2024 00:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v75Znqny";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lzFzqbir";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VRsqfvVQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iSEPQeP3"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067111362
	for <ksummit@lists.linux.dev>; Fri, 19 Jul 2024 00:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721350167; cv=none; b=odk6sQbqnc4TtuAKSu8miQZRm3xFSLHu3RBKS2gexN0YisJus4s0Ilix6t15pMxwhS6I60RxMIc+YG4w0mfnwyk/5Sn3RuCn7Vs8XTKx1TNmrRaNIg8JmBXQTM2yVKrVTNMMrcFCb0dNF4c6m7L3LdbHs+5no9AULbGRX+ELguM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721350167; c=relaxed/simple;
	bh=V1YctNIF2Q+9sMwsimV0P6dWNWIxdo1on6+hdAq4WQs=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=fJ65/faCyOuzr2ou5mknehYYtXDTWmZB0qb1Sh1c2lG3bkgaIT1HstfkMTj1XYLL0XNOHe7O+42Cs/BiCbdPJVtrT/S7DKYcr9P7n3Aj5ChUwQfwdukMU3MPaZgNNsg41MF2bcvgiqBKndJSS3zXsY6wV8u/Fi14XjbGhiHL4iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v75Znqny; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lzFzqbir; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VRsqfvVQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iSEPQeP3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EDE021F786;
	Fri, 19 Jul 2024 00:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721350163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fFW034huYZMS+o867ktbY9HlZxlDcW+/lNrIegeEZk=;
	b=v75ZnqnyjpdqwiQcn7lpqQYEKCi0fF+96X7IanNPngRE6ovxfGTU7YGJl15hAYYUTP4OkH
	MwTFqWEep1v+Sqt8agIvrNK/pRXzAT5qcR+WdYrtFyPpiz4IXQPai2/JXzVvOw2lD7XjR/
	OHr9ulc3PfrJjxEvWEbPW0bcVl+OQiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721350163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fFW034huYZMS+o867ktbY9HlZxlDcW+/lNrIegeEZk=;
	b=lzFzqbir4gFbRofKOeMmPmN9C+lYNWwqwMpIOAowcndzLrZ1bgQvHVAIwAp9lyr/RYZech
	jZikjXhsrz9wXPBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VRsqfvVQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iSEPQeP3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721350162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fFW034huYZMS+o867ktbY9HlZxlDcW+/lNrIegeEZk=;
	b=VRsqfvVQbOUHDDcTOp/KscSSpxGcro6IvyYIGHp3xA61HgYNfb/M77ccaXtoeH5KJi9E2S
	DKXwJofl1m+GgGXZAzklu+HQxbew0xSRBewoYiHk7YooEhXpGbFCvsPtGqXvBNGYYtbh/G
	JulrWuRxNPNF8X0pHylp30SjmcrjvyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721350162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fFW034huYZMS+o867ktbY9HlZxlDcW+/lNrIegeEZk=;
	b=iSEPQeP3fPN53qPsR+Oq6vsPldn+zdquKakAIvHQ9lSWDQ8pr/xomSV3k8HhcgOyYnSoJ5
	8Y8c5UXxwcfWDrDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 450C9136F7;
	Fri, 19 Jul 2024 00:49:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zxJaOg+4mWa2PwAAD6G6ig
	(envelope-from <neilb@suse.de>); Fri, 19 Jul 2024 00:49:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: "James Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Takashi Iwai" <tiwai@suse.de>, "Greg KH" <gregkh@linuxfoundation.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Theodore Ts'o" <tytso@mit.edu>, "Sasha Levin" <sashal@kernel.org>,
 ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
In-reply-to: <1a8e6672-5431-4125-8d10-b00da89f84e7@suswa.mountain>
References: <>, <1a8e6672-5431-4125-8d10-b00da89f84e7@suswa.mountain>
Date: Fri, 19 Jul 2024 10:49:17 +1000
Message-id: <172135015702.18529.2525570382769472437@noble.neil.brown.name>
X-Rspamd-Queue-Id: EDE021F786
X-Spam-Flag: NO
X-Spam-Score: 0.99
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.99 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[hansenpartnership.com,suse.de,linuxfoundation.org,gmail.com,mit.edu,kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spamd-Bar: /

On Fri, 19 Jul 2024, Dan Carpenter wrote:
> On Thu, Jul 18, 2024 at 10:56:14AM -0400, James Bottomley wrote:
> > On Thu, 2024-07-18 at 09:48 -0500, Dan Carpenter wrote:
> > > On Thu, Jul 18, 2024 at 09:34:04AM +0200, Takashi Iwai wrote:
> > [...]
> > > > It's no "regression", per se, but
> > > > a new feature that didn't exist in the past, after all.
> > > > 
> > > 
> > > If it's not a regression then don't add a Fixes tag.
> > 
> > Really, no, that's what got us into this issue in the first place: if
> > you only tag regressions with Fixes:, then we don't need cc:stable. 
> > Fixes: should be for anything that updated what was done in that prior
> > commit (including white space and spellings).  That way there's no
> > debate about whether it should apply and it's easy for Maintainers to
> > verify.
> 
> I'm honestly surprised you would say this.  You're very much in the
> minority view here.  I've reviewed over a thousand spelling mistake
> fixes across the whole tree as part of kernel-janitors and I don't
> remember anyone asking for a Fixes tag.
> 
> The one area where people debate is for harmless static checker fixes
> such as deleting an unnecessary variable, but the majority of
> maintainers say that doesn't qualify for a Fixes tag.
> 
> The majority opinion is that Fixes is only for bugs.

First you said "regressions".  Then you said "bugs".  Which is it?

If I add a new feature that doesn't work as documented, it is clearly a
bug.  I don't think it is a regression.  I think the patch that corrects
the bug (either the code or the documentation or both) is a fix and
should be marked as such.

NeilBrown

