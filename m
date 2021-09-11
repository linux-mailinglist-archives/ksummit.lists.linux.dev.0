Return-Path: <ksummit+bounces-523-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id E8242407AC7
	for <lists@lfdr.de>; Sun, 12 Sep 2021 01:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 533453E10C2
	for <lists@lfdr.de>; Sat, 11 Sep 2021 23:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC903FDA;
	Sat, 11 Sep 2021 23:22:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A7E3FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 23:22:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7697610C8;
	Sat, 11 Sep 2021 23:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631402541;
	bh=XM6wtroYxZ57uJxUOzmFSPd3NhY2IJT8q8stp6UfnCE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LuFRXZoiXXVT6G8zJ+rpFV6v7G2tJ9TGQTaahvC1HBHiSa6ke4eWnfOS59pdJ2JrG
	 vJV+RiY8VSWZCUvR37hmBwxoCf1XfNOK+GmVa1ZCej+/zlnzN5iC7vVPFr90LLkOdq
	 dtcqXAEXSMHbsagEvGnwPpGTQyW7BHvxAafhCwEByWXKs57tbQV4d3rIsj2XS89kMd
	 ZbtB/4GpsUJskEYE5vczTXFwGy62xbHT/1W7NrgM5uwfak1SeTsQCj7Op/+i6tdZZb
	 oMynGeL1LcyRNn2nRrkz0H7g88+hK+eiJBX0R6dzyjeBRmnVxZZZt0uzD2/Mw9x4Vj
	 SGaPrjBn8ec5Q==
Date: Sun, 12 Sep 2021 01:22:17 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner
 <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Jonathan
 Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210912012217.6cc57505@coco.lan>
In-Reply-To: <20210911102007.77b8a189@rorschach.local.home>
References: <877dfop2lx.fsf@meer.lwn.net>
	<20210911005214.71b55ac6@coco.lan>
	<YTvuDsrUNhg/VXD0@localhost>
	<87ilz8c7ff.ffs@tglx>
	<YTv2YvLmzlJA4+tc@pendragon.ideasonboard.com>
	<20210911102007.77b8a189@rorschach.local.home>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 11 Sep 2021 10:20:07 -0400
Steven Rostedt <rostedt@goodmis.org> escreveu:

> I would like not only documentation, but also an open source test suite
> that simply tests the interface. Honestly, I believe that all new
> interfaces to the kernel (open or not) should have full documentation
> and a test suite interface before it gets accepted

Btw, I've been working on an improvement for scripts/get_abi.pl, in order
to allow it to check for missing API documentation:

	https://lore.kernel.org/lkml/cover.1631112725.git.mchehab+huawei@kernel.org/

It basically reads everything under /sys and at Documentation/ABI,
and checks if something was found at sysfs but there's no
documentation for it. It allows to optionally search for an specific
string (actually, it uses regex):

	$ ./scripts/get_abi.pl undefined --search-string devices.*cpulistaffinity
	/sys/devices/pci0000:00/0000:00:01.0/pci_bus/0000:01/cpulistaffinity not found.
	/sys/devices/pci0000:00/0000:00:01.1/pci_bus/0000:02/cpulistaffinity not found.
	/sys/devices/pci0000:00/0000:00:01.2/pci_bus/0000:03/cpulistaffinity not found.
	/sys/devices/pci0000:00/0000:00:1c.0/pci_bus/0000:04/cpulistaffinity not found.
	/sys/devices/pci0000:00/0000:00:1c.1/pci_bus/0000:05/cpulistaffinity not found.
	/sys/devices/pci0000:00/0000:00:1c.2/pci_bus/0000:06/cpulistaffinity not found.
	/sys/devices/pci0000:00/0000:00:1c.4/pci_bus/0000:07/cpulistaffinity not found.
	/sys/devices/pci0000:00/0000:00:1d.0/pci_bus/0000:72/cpulistaffinity not found.
	/sys/devices/pci0000:00/0000:00:1d.4/pci_bus/0000:73/cpulistaffinity not found.
	/sys/devices/pci0000:00/pci_bus/0000:00/cpulistaffinity not found.

While it won't check the quality of the ABI, it would let someone to
at least double check if a driver is not exposing something undocumented
via sysfs.

If someone wants to test, the newest version is at:

	https://github.com/mchehab/linux/commits/get_undefined

Thanks,
Mauro

