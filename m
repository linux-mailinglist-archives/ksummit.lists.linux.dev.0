Return-Path: <ksummit+bounces-1429-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6C2931B02
	for <lists@lfdr.de>; Mon, 15 Jul 2024 21:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21EEC1F22159
	for <lists@lfdr.de>; Mon, 15 Jul 2024 19:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0E6136643;
	Mon, 15 Jul 2024 19:28:40 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB33531758
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721071719; cv=none; b=n19ysZzrexYa0Q1mvSb4DVynZerkBgzLMlUu2ryG+30LExMyh1XEPLgbVLnXj+zZqvI4dlzs3Za3VLR6CDaPSRBvFqeq61kXsMvzlGHk2/ZTBB3L224trw/OWPS0PJfdFwCG8o/PNGibaGjXcU5Sc3nLdw4d1yK/BZBuDGw7arE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721071719; c=relaxed/simple;
	bh=8S2Qyxn6QAZWJoiAdK+G2dLAmGIO4ragbAfMAcG32aM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gdBWd1cLMU/BTJbPHcP+uHK+skjNiBA8+GgwsZ3Dk/ChzIT4qPVJ+PGfPlgs1REy/H9APMuyyExxifvg9870kRBxBszkvDJL2nICCGX1W6MAhUgAsRWGKULvhfZ8jNGglUzrFTRSHXI/UbfudxOIPpXVTMOTlqy3s6X0PYSxEWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A545AC4AF0A;
	Mon, 15 Jul 2024 19:28:38 +0000 (UTC)
Date: Mon, 15 Jul 2024 15:28:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Theodore Ts'o <tytso@mit.edu>,
 Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev, Greg KH 
 <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <20240715152837.75c3845f@rorschach.local.home>
In-Reply-To: <2d787d2e12b336f94afe5549cbfef4e1e20d9a7f.camel@HansenPartnership.com>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	<915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
	<ZpQbQa-_8GkoiPhE@sashalap>
	<f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
	<ZpQyeLFJY1gJvRRA@sashalap>
	<20240715180000.GC70013@mit.edu>
	<fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
	<2d787d2e12b336f94afe5549cbfef4e1e20d9a7f.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Jul 2024 15:24:42 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> On Mon, 2024-07-15 at 14:06 -0500, Dan Carpenter wrote:
> [...]
> > The one question I have is for patches which pre-date git.=C2=A0 I was
> > told to leave the Fixes tag off in that case, but I think that's out
> > of date. It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-
> > rc2")". =20
>=20
> Actually, we have a history tree (based on Bitkeeper) that goes back
> before that:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/
>=20
> So I'd tag these as
>=20
> Fixes: 3bc0a5f5c1 (history "ext3: reservation info cleanup")
>=20

I don't think that is necessary. If something is found to be broken
from before 2005, I don't believe it's worth the effort to search
another tree for the actual change that introduced the problem. When
you go that far, it becomes only an academic exercise.

-- Steve

