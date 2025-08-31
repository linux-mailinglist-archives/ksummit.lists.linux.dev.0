Return-Path: <ksummit+bounces-2243-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC9FB3D3CE
	for <lists@lfdr.de>; Sun, 31 Aug 2025 16:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DCBA7A1940
	for <lists@lfdr.de>; Sun, 31 Aug 2025 14:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FE9263F54;
	Sun, 31 Aug 2025 14:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqnnGmSR"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A25B522F;
	Sun, 31 Aug 2025 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756649025; cv=none; b=jtLGT4wMLXsTdPW8991UPtZ/6LH+xEw9k1pQZ42Hr+Exy6eBOXhmSlp6Cg2Ublbfut8qoPpMLTmkLZNWZsu23x4JSYu4BDTX6jtGGGawKD9ItiR9ffFf2QC/zMqXXTQ6KR6iJYt06yxT0XtOBt0B6/96XQVRUsvIt0tcVhy8ZLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756649025; c=relaxed/simple;
	bh=5+wsgFlFd6VP1CQcT5ANSHlZeINjAgalK+3OTuqlpWk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mu+ympbeu3HRgfpXzAT85MN4JYwgBMJr9VYcQegeaTNqc3Nt2U+WYNGbsqfpX4PeaPH7ao9n2LxJkxoJcDVs1Q1hd1fOVNdIfUNncf+nJtMAcMQXYfRl+9Fg21xSxxtDPKTh0wC9DbpuPkwiwqRfBF8bsk3odlEOju+nBd+aUqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqnnGmSR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F88EC4CEED;
	Sun, 31 Aug 2025 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756649024;
	bh=5+wsgFlFd6VP1CQcT5ANSHlZeINjAgalK+3OTuqlpWk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VqnnGmSRsJxhPlFhHjtZjDyrxk79bd/DSveMcloXKSx2WvR0xFYXC7slLVAp3vKVg
	 buPn+TXpNE/EHzrAKwtzm7EyneRC9NFgw4kVxI8VCG5tOiAXnEWVwjfbyw7CSck88m
	 BeF/Nprwh+bmHdMUjivwa7zf3DKK4qfpyMte2M++CBOsrwSyvJNJZExlCBp8SmhFp2
	 Jnpt79JjQPShns6GeyyHiyGbvnOGo+os/ERfR3kraWD/Lgd3IDJHikIJHtPeQLKXaO
	 aYPImjBqWmjrTJ755sBbcgNIgRrz+nFHhvAo/Wqz8tbpwxkwxa2Itu3MfoEIhx9NHA
	 TADIUv6SdBhAA==
Date: Sun, 31 Aug 2025 16:03:39 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250831160339.2c45506c@foz.lan>
In-Reply-To: <87h5xo1k6y.fsf@trenco.lwn.net>
References: <87plcndkzs.fsf@trenco.lwn.net>
	<20250828230104.GB26612@pendragon.ideasonboard.com>
	<87wm6l0w2y.fsf@trenco.lwn.net>
	<930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
	<20250830222351.GA1705@pendragon.ideasonboard.com>
	<87h5xo1k6y.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Em Sat, 30 Aug 2025 17:08:53 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
>=20
> >> > Last year we tried an experiment with a bit of funding from the LF to
> >> > create a bit of paid documentation; for a number of reasons, that
> >> > experiment did not work out.  But it seems there should be a way to =
make
> >> > some forward progress on this front. =20
> >
> > Is there anything we can learn from that failure and that number of
> > reasons to make the next attempt more successful ? =20
>=20
> I think that the experiment didn't work for a couple of reasons:
>=20
> - The topic area that we settled upon was a relatively advanced one, we
>   really should have started with something simpler.
>=20
> - The writer who was assigned was not really up to the task; I found
>   myself repeatedly having to explain basic aspects of the C programming
>   language, for example.  That made it almost impossible to get a
>   satisfactory document out of the process, made worse by the first
>   reason listed above.

The way I see, there are several orthogonal tasks.

1) Book set organization

The first one would almost certainly require LF or someone else sponsor
a person with lots of experience on organizing and reviewing technical
books that worked on similar projects.

Such person would be starting from top to down, organizing the books
on a way that the basic knowledge would be covered at the first chapters,
and more advanced items at the end, and missing chapters will contain
skeleton ReST files on it to be filled by someone else. After having
it, review the text, specially for the less technical chapters, to
ensure that it is accessible to kernel newbies.

2) uAPI documentation

This requires highly skilled people or advanced userspace developers,
and should be done subsystem by subsystem.=20

We did that on media several years ago, and, although not perfect,=20
I do think that we cover almost everything for uAPI, with examples,=20
tables images etc.

=46rom my experience, uAPI is easier to document than kAPI, as it doesn't
change that much (not counting sysfs/debugfs/configfs).

On media, we started enforcing documentation for all new media uAPI.
We then reviewed the gaps and filled in the blanks.

3) ABI documentation: sysfs, configfs, debugfs

Such ABIs are a different best: we have dozens of thousands of sysfs symbols
on a server. Last time I checked, most undocumented.

I wrote a function at get_abi tool to help finding the gaps: it can help
identifying missing gaps by converting ABI descriptions into regular
expressions and check against the real sysfs nodes found at the system(*).=
=20

I'd say that someone without intermediate C knowledge can probably use it
to produce a lot of missing ABI documentation.

(*) The tool itself can easily be modified to also handle debugfs/configfs,
    but there are too many gaps at sysfs. I would start with them.

4) kernel-doc kAPI

It shouldn't be that hard to do the same for kernel-doc kAPI documentation:
kernel-doc now can parse the entire tree with:

	$ scripts/kernel-doc .

Someone can easily use it to discover the current gaps at the docs that
have already some kernel-doc markups and identify what of them aren't
yet placed under Documentation/ ".. kernel-doc::" markups.

So, I'd say the first step here would be to ensure that 100% of the
docs are there somewhere. Alternatively, we could place all the rest
of functions with kernel-doc markups outside Documentation inside an
"others/" book - or even "<subsystem>/others/", and then gradually move
them to the right places.

5) kAPI itself

Except for trivial cases, I don't think that only kernel-doc is
enough. On most of the cases, a document describing the main
concepts and the design behind the kAPI is needed. Almost certainly
only core developers and maintainers within each subsystem can
write those.

> What it comes down to, perhaps, is the same old problem: the people who
> understand the problem domain well enough to document it can generally
> make a more comfortable living creating more undocumented code instead.

True, but I guess this is valid mostly for (5).

Thanks,
Mauro

