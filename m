Return-Path: <ksummit+bounces-2242-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9EEB3D027
	for <lists@lfdr.de>; Sun, 31 Aug 2025 01:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A8A720387C
	for <lists@lfdr.de>; Sat, 30 Aug 2025 23:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E723E25A2DD;
	Sat, 30 Aug 2025 23:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jeBdiy3q"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92652940D
	for <ksummit@lists.linux.dev>; Sat, 30 Aug 2025 23:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756595342; cv=none; b=mGhjyjRNoYjVZ1Alr4G2MTN13+V5fIFmX62umr1aeV9aHtzxyZ8jGaaYg6zhbBHh9ApluJXXlTHHrAdTfGT+pm1HiYG6wTmI4dbJUguMQHkr0RT55jZw93EEhrCj1bQMznl1B8wcSSsZZ3XXcaIrSUhNeVl/kGmn6qEELZw+l9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756595342; c=relaxed/simple;
	bh=LdAEqHX2oQ3xtzFXDEpvQ1zDjnl+Z2GAhZegTd2IHaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZvdWfdjh07vM6/4hzjag3ESUxvTdDF+yFwHddPelFDE57i9qcLKM1mOMSLf7HALiyTRXbvYtk0Fl8Xr6pNs91ICYcTvsCE1WCQyJOe39+PNxuRAvftYFZbvAYh0aJYiWAdY+FpOcscwGgqp5c+gWTleEMEXrEbAn98538CdCQ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jeBdiy3q; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 02E7040AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756595334; bh=PBDbakEdOvzzqeqVqQWRwqaI4NhIjQu67A1X25kx+8U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jeBdiy3qkFEkjn1y0AYVCTfjGeUJ5n2+5hGaeergggnBmE5A4s2mRjucjUzcZlReq
	 ++6FDh0jcAd/O1krWxExh4+98EY7wD7HLw0KJGJ0Iu1ravWEGs2nZ0Xea/VuHFKh76
	 rFEglHyKINclVYPE/iWV0aq4PFGiOtili3J56nj+G4VhicnF1QRJzlaDyeEx2URK2N
	 DTU0zg+agGObIYTY2svVaI/gVb8ZbnbNdHa79/giA2udoJYlQUNZCgr99mh4yK4Jad
	 kIcmv9DDv9cDohiIpXK/2udl6/T4ragdV4XtV+VQpV4/f7nI5l2PNawT4nkrRDhlUJ
	 WFIxu8DRLV2nQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 02E7040AE2;
	Sat, 30 Aug 2025 23:08:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>
Cc: ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <20250830222351.GA1705@pendragon.ideasonboard.com>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
Date: Sat, 30 Aug 2025 17:08:53 -0600
Message-ID: <87h5xo1k6y.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

>> > Last year we tried an experiment with a bit of funding from the LF to
>> > create a bit of paid documentation; for a number of reasons, that
>> > experiment did not work out.  But it seems there should be a way to make
>> > some forward progress on this front.
>
> Is there anything we can learn from that failure and that number of
> reasons to make the next attempt more successful ?

I think that the experiment didn't work for a couple of reasons:

- The topic area that we settled upon was a relatively advanced one, we
  really should have started with something simpler.

- The writer who was assigned was not really up to the task; I found
  myself repeatedly having to explain basic aspects of the C programming
  language, for example.  That made it almost impossible to get a
  satisfactory document out of the process, made worse by the first
  reason listed above.
  
What it comes down to, perhaps, is the same old problem: the people who
understand the problem domain well enough to document it can generally
make a more comfortable living creating more undocumented code instead.

jon

