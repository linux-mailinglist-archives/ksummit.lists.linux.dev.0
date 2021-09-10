Return-Path: <ksummit+bounces-504-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9DA40741C
	for <lists@lfdr.de>; Sat, 11 Sep 2021 02:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 36EB23E10DE
	for <lists@lfdr.de>; Sat, 11 Sep 2021 00:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E793FC3;
	Sat, 11 Sep 2021 00:04:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D3D2F80
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 00:04:57 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1631318117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8iPA0TSz/t7qm1S8AhgSrhuGuY1N96m7e0bOHWAXtmk=;
	b=2sF5juCzvx2AS4VPMsiBS1xtxUJd3Zme/yANkdMEPVdulg09pLoBi/DzCC7IAvtxqZezqW
	sQG2LELYeW+N0hBJ0VnCtqKjNOoVCdfzjGRa1SGFIQ/hm0e8YgrOHgaz5Jqu2T3BYZYcoz
	ZBCwrcdoyWvJ5yfwo6Znbwdvt6WW/YbxfSZn+FrQXfWazpSxV5pYYhk6RrxhvAZg/z8W4/
	z/YI6XoCZuo//uUo0wDLtVSfv7CZ5JPHQYT/IcnBV5tGN61LAYICf78dvUJ4PuK2F2nkLf
	HsOrZPHH5mIhkmCSu2k92HACC7eo5Cligbeaug7kWqrb8Yud1AHyqyXiMMjvVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1631318117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8iPA0TSz/t7qm1S8AhgSrhuGuY1N96m7e0bOHWAXtmk=;
	b=zKSH2kLyQhbuZP7mmsoNbIYbeUAbaO8wdK3iuMkQ+6dIkwm5TFA8OpyYdmYxI5wNJtRp/k
	XngDpLXaHbnwDVCQ==
To: Josh Triplett <josh@joshtriplett.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
In-Reply-To: <YTvuDsrUNhg/VXD0@localhost>
References: <877dfop2lx.fsf@meer.lwn.net> <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
Date: Sat, 11 Sep 2021 01:55:16 +0200
Message-ID: <87ilz8c7ff.ffs@tglx>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 10 2021 at 16:45, Josh Triplett wrote:

> On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
>> On media, enforcing userspace to always be open source would
>> have been very bad, as it would prevent several videoconferencing 
>> software to exist on Linux.
>
> I don't think we should enforce that all userspace users of an interface
> be Open Source. I do think we should enforce that *some* userspace user
> of an interface be Open Source before we add the interface.

The real question is whether the interface is documented in a way that
an Open Source implementation is possible. It does not matter whether it
exists at that point in time or not. Even if it exists there is no
guarantee that it is feature complete.

Freely accessible documentation is really the key.

Thanks,

        tglx



