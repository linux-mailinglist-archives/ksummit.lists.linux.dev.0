Return-Path: <ksummit+bounces-1408-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F09930C2C
	for <lists@lfdr.de>; Mon, 15 Jul 2024 01:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DE712813B3
	for <lists@lfdr.de>; Sun, 14 Jul 2024 23:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F8113E3EA;
	Sun, 14 Jul 2024 23:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rs/1Z9Vq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="onaZFuLY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PNASC2UP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c/DCbktu"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9429474
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 23:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720999802; cv=none; b=gkATjhYbL4hZhFcyvApeDwthP0rmW56KlOYGJQq/rrKPPCjMTfhrMWAtkSbQ70yNV1N6rN0AP6c5c41CCykvhih1/ChCKuHqioomqQmPkXKAT216VzHJAWfE6wHyYrtCjjhKpkU8GiLXL1AxQew7D0H8Y0i+B2V8g+2pg5oGydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720999802; c=relaxed/simple;
	bh=+f3/AG0Fih2A4cIpQSNhpkvrSXzWzdLIdvVR/6DVjBM=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=THdK60QRK4J0/DvHMUxGFjBU/zFykrnx59lIFSf0KdiXzlPfeJPbVLK7VhBrjeygzEsct3qE3zr7Zuk3kGdnqZXqdzq1Yt3H1rhGMolUFzEerWNZxOcYTCce5lKsDhpZSSXCsvOTp/QVaA+0JVF2lH1z3hPVB4EXza571GT4Gco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rs/1Z9Vq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=onaZFuLY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PNASC2UP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c/DCbktu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7C81A1F7CE;
	Sun, 14 Jul 2024 23:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720999798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Plq70wG6tcWJq4DK8oZv8H/3Gb3CbDrOFsYLP044cms=;
	b=Rs/1Z9VqsPbU53Vbw3oB/i06iy6PxgQMX4Dbn0LaCTZHZY/snfBSy6573kBojl47Af0zH0
	/LdZUYBdy3RHRuCnUYXQoP33rvQAjA1LcpCCpGIkyrr+B9Xmb33q5O5u5Awx2eHOfONMml
	WvoLP9VmxHcWJL3NkX+R5dNj0+gzP4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720999798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Plq70wG6tcWJq4DK8oZv8H/3Gb3CbDrOFsYLP044cms=;
	b=onaZFuLYdjUb2qXVvzT4IywUNk5YM+fd9UDyYFwXhHFwWSoklvUcqi/qmr2yKxvk0EES/3
	yRUX6bk7hOlsvoBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720999797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Plq70wG6tcWJq4DK8oZv8H/3Gb3CbDrOFsYLP044cms=;
	b=PNASC2UPIKhc9pJEaZz663urZFvazrwBUlDodEPH3XkyhqGQb1rFPHM14Pqg/6KC7K/Ci4
	8kh0ZUVwJ3dqhkAdiUx2zYYzhtbZd8pIFTzy/dgHbUzljNpRsOuhsKfG5rFxOq1dHVmMgE
	bOAtS9jANe44ealTof53oED+NBdfOm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720999797;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Plq70wG6tcWJq4DK8oZv8H/3Gb3CbDrOFsYLP044cms=;
	b=c/DCbktumw/L0o4BDFteAQxLbU1oBsmUBFLDgFjJH0GTje3XLrSL5Jmy5o6lvFvcWGcly+
	o3+blPn3gNTTjPAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A877A137AC;
	Sun, 14 Jul 2024 23:29:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P54dF3NflGaQdAAAD6G6ig
	(envelope-from <neilb@suse.de>); Sun, 14 Jul 2024 23:29:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "James Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Sasha Levin" <sashal@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>, ksummit@lists.linux.dev,
 "Greg KH" <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
In-reply-to:
 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
References:
 <>, <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
Date: Mon, 15 Jul 2024 09:29:51 +1000
Message-id: <172099979104.15471.15239002304647683093@noble.neil.brown.name>
X-Spam-Flag: NO
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Mon, 15 Jul 2024, James Bottomley wrote:
> On Sun, 2024-07-14 at 16:27 -0400, Sasha Levin wrote:
> > On Sun, Jul 14, 2024 at 12:27:55PM -0700, Linus Torvalds wrote:
> [...]
> > > I would hope that *all* commits improve on something. And if it's
> > > an actual fix to a previous commit, it should say so.
> > >=20
> > > If it's just a random improvement, it shouldn't refer to a previous
> > > commit at all.
> >=20
> > This is *one* view. I've observed that both individuals and companies
> > started requiring a fixes tag unless they're writing a new feature.
> >=20
> > Heck, back in Google you couldn't commit anything that is not a new
> > feature unless the commit message had a "Fixes:" tag to make the bot
> > happy.
>=20
> But we know how to enforce a unified view of process: we document it in
> Documentaion/process ... and indeed we already have a handling-
> regressions.rst which says:
>=20
>     * Add a "Fixes:" tag to specify the commit causing the regression.

Interesting.  I don't think Fixes means that the target introduced a
regression, though that is one possibility.
Fixes could also mean that the target introduced a feature that didn't
quite work as intended.
Sometimes Fixes means that the target introduced a typo in a comment - I
wouldn't use it that way, but some people do and I find it hard to
disagree.
(and maybe all these targets do regress the "total perfection" score for
 Linux.....)

I'd generally be happy with any commit marked "Fixes" getting into a kernel t=
hat
contains the target.  In my mind the issues are more about:
 - how quickly should the fix land.  There is no easy answer.
 - Are Fixes focused on a backportable fix, or do they combine a fix with
   new functionality?  I think they are often quite focused, but it
   wouldn't hurt to often remind each other of the importance of focused
   fixes.

NeilBrown

