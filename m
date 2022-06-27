Return-Path: <ksummit+bounces-726-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5274555BAB2
	for <lists@lfdr.de>; Mon, 27 Jun 2022 17:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAA48280C76
	for <lists@lfdr.de>; Mon, 27 Jun 2022 15:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB52333E2;
	Mon, 27 Jun 2022 15:27:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53E83235
	for <ksummit@lists.linux.dev>; Mon, 27 Jun 2022 15:27:55 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1E1ED385;
	Mon, 27 Jun 2022 15:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1E1ED385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1656343675; bh=uVoVEVGeEl0qEwy9RkIVGW0KLeA9wFesbP4eMDk3ts4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VkyxlfPxQShQ6O1H8hLy2IDZy+kPQmy3e4AemA/hoxOhxT3jSYbxCf3RPaBeDOyLw
	 VNascPbhK8ykq7FXEA2NF7nnq8n2oZhy1wuiueQXc98G8oi1fDnxRQp75L4VPYDyK1
	 GImbNBk3hmpcM84NQk/IPVbYrWW84KvpuKAvx4WJ7yF4X4n4qf55EiZJ/YLcIxje2Q
	 fqR2GlYT9MZmI7hroJPoY/y9p/1u/s//EYouPO8VlkE4Ox/msCI3NCe2uN5ipk5wZA
	 whDfHbWrCvVkb6UEZXfh0JkJbw9TLfAjcMgxsP8vAtdXIqvd5xdIkKr+HItQW7V4z9
	 wQbfcQviC38eQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Markus Heiser <markus.heiser@darmarit.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>,
 ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
In-Reply-To: <963dd061-47ba-6f96-72e2-4f34cc952b8c@darmarit.de>
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
 <875ykrrb45.fsf@intel.com> <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net> <20220624083307.159824bd@sal.lan>
 <963dd061-47ba-6f96-72e2-4f34cc952b8c@darmarit.de>
Date: Mon, 27 Jun 2022 09:27:54 -0600
Message-ID: <87fsjqyvlx.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Markus Heiser <markus.heiser@darmarit.de> writes:

> IMO It is unnecessary that the build-chain must run on all
> platforms and with all distributions.
>
> Who observes the Sphinx-doc & docutils development since (>15)
> years is aware that with various (old) Sphinx-doc & docutils
> versions no stable results can be produced, not without
> complicating the build-chain.  And this is exactly the situation
> we are facing today.
>
> The build chain of documentation has nothing to do with kernel
> development (at least in my opinion) and should be decoupled from it:
> maintaining one defined build environment is enough work ... this
> becomes especially clear if you (as Jani recommends) rely more on
> sphinx-modules and widely used tools.

The counterargument to this is that we want as many developers as
possible to be able to build the docs and contribute to them.  We can't
complain that developers have broken the docs build if we don't do what
we can to help them do the build themselves.

One of our longstanding contributors is on Sphinx 1.8.5:

  https://lwn.net/ml/linux-doc/4c403239-3c71-4ab9-2168-f7e9d77008b2%40infradead.org/

I would like to narrow our range of supported versions, but I really
don't want to cut people out.

The real question, perhaps, is whether requiring people to set up a
virtualenv to run a supported version would be too much.  It's something
I worry about.

> Another point on which I now have a clear view are the regular
> expressions: no one likes them (me too), but I can't think of a
> general solution (parser) given the number of requirements for
> parsing source code we have.

I fear you're right.  There are nice C parsers for Python, but they
don't work at the level we need; we need the comments, unexpanded
macros, etc.

That said, the regex expression in kernel-doc is out of hand, with no
documentation, lots of duplication, etc.

> I would like to support the kernel community again, but at the
> moment I have difficulties to follow the many exceptions. I would
> be happy if you keep me in CC .. may be I find my place again
> back in the kernel-doc development :-)

We would be glad to have you back.

Remember that the reason I was hesitant to take your kernel-doc rewrite
at the time was that we were already thrashing too many things and I
wanted to hold at least one piece stable.  Hopefully we're past that
phase now...:)

Thanks,

jon

