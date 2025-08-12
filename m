Return-Path: <ksummit+bounces-2128-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD4CB22972
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4065D7A3849
	for <lists@lfdr.de>; Tue, 12 Aug 2025 13:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2403288C09;
	Tue, 12 Aug 2025 13:57:58 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F38328853D
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755007078; cv=none; b=b6pf9SWx0aWGfe9zc7735xs5O6oFYsXptceXfoRgSOhFScPLSq9jvgGx1Ge0I3z1Ut3VYfXhynfGeODBfWSZ+7ybNPs4vczAfUa1t/W3KGbIB9LtPgy4xGdJf+cAXLNIAOlFkpMzgm2f22hBJuxCd5cbBU1XYN1xts7qPReU5RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755007078; c=relaxed/simple;
	bh=1wwKnloEX/akku0dp1/+zF2ZSkiLCB/patSD56Epevk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSyfujfsWIV6otXz1gF4cLyTEGVy318xRCN6WoGe2PIlcY7MEtBqdLGFEAGa3Qtf1diPPI4yJ7BdOQ0FRaUBqCjg6LQ0dBCkWedNSESgYUnpScMiTYa1WzdnEcuNaVQf6P9lGt/w4H5BWeFTe1LZjkeyiiO88C48HWmjVJWhVoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 2B7865871B;
	Tue, 12 Aug 2025 13:50:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 8EB6132;
	Tue, 12 Aug 2025 13:49:58 +0000 (UTC)
Date: Tue, 12 Aug 2025 09:50:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <20250812095043.4def29d0@gandalf.local.home>
In-Reply-To: <2da83ff9881bef84a742c06e502c91178a78a8a3.camel@HansenPartnership.com>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
	<56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
	<c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
	<2da83ff9881bef84a742c06e502c91178a78a8a3.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8EB6132
X-Stat-Signature: w5tn66u14qs5bpyum1f8p3auxurmkkoj
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/yH0N0LPGB2ddkbxBOPBBd7JW7JPbmnkM=
X-HE-Tag: 1755006598-379381
X-HE-Meta: U2FsdGVkX194Lms3uO6M2GrspoEy0UraQK6NJgLjkYPyZYAVX+bBP+qvVLTavrCUEqH1Blf8jIKKlPGejEQaVy2iu0NctFgDOIvQ5KDyu1QUrd2+xpTi7iI/YnAwmu9S08JQSlyWnC9ti6nBw86GmPecduZZFNdYslS7XT9xzgiZuJ3TBrLFEin4qbqk9piR9NBBSV1ozC87QdHI3vsfYcKhN/5zQbXJ4JGIDkin7PTG6Xke9ifZhytcJShC58Qqs5RE/2az7ngm8saFvLzWJJ4Mw0e1k16EPLHR3aMq7aMx1+0JCvjAOhvL4AZSmmhyept+Ah8Z/1PnF8evJVZXClxVydmEq8njTtbCNeZV+xpuqgxNMqjJE4JrvKyLI7k1OO4lnek+ClP0djHa3mzy/k5XNm+Nw+kx

On Tue, 05 Aug 2025 14:34:40 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> > Sure - Steven encountered this in [1].
> >=20
> > As he says there:
> >=20
> > "If I had known, I would have examined the patch a little more
> > thoroughly, =C2=A0and would have discovered a very minor mistake in the
> > patch." =20
>=20
> Heh, well now you make me look it seems that the minor mistake is
> adding at tail instead of head?  That seems to be because the hash list
> API doesn't have a head add ...
>=20
> I wouldn't really call that a subtle problem because the LLM would have
> picked up the head to tail conversion if we'd had an at head API for it
> to learn from.

That wasn't the minor mistake I was referring to. The mistake was that it
dropped a __read_mostly annotation. Which after further review, was
actually OK and something that should have been done in a separate patch. I
have other tags that are required for alignment and such otherwise things
may break mysteriously. It could easily have dropped a different tag that
would have made a difference.

The point here is that it most definitely will introduce very subtle
mistakes. More subtle than what a human may produce and much harder to spot.

-- Steve

