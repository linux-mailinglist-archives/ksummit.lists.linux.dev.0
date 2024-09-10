Return-Path: <ksummit+bounces-1558-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0F3973593
	for <lists@lfdr.de>; Tue, 10 Sep 2024 12:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD9EF28DB8A
	for <lists@lfdr.de>; Tue, 10 Sep 2024 10:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61398178367;
	Tue, 10 Sep 2024 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="ez5UInKF"
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF99C8DF
	for <ksummit@lists.linux.dev>; Tue, 10 Sep 2024 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725965578; cv=none; b=eAOiCxSBUcxDbcIVHccwodf3ElYpE443XIzM+FvDbcwKQI37SZVx655gOvlKFnqyTLwvpU+vLYyQj62AEcmxvGLHocmi670RPZB3qYd1vP03tBYqSvYF5WkNOsUu1gA2ZeJYSlEnL/z13gHiFwDlvnwtn+Ozz4tXv9+QtSfnaYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725965578; c=relaxed/simple;
	bh=WdaLVYGugrq06HlW6mwl952gy+qYVIf3Fv0x+fewd30=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=eqzMO6zBpVAK0acFhja9nCESR3FsPeHWSvQtxufVCqPIaA0aOwCokT1rfrN6FT7VTekrWt/dTY8/lwduePe6UdNQs3vWCy9Oz+bGi86mIpTFH2xwiFn88bskhbYFaDRfYWhQTRdCvDjzdqoYIUX0Z46EbnRtQ0eW8eGyg56xLKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com; spf=pass smtp.mailfrom=arinc9.com; dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b=ez5UInKF; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C1A540004
	for <ksummit@lists.linux.dev>; Tue, 10 Sep 2024 10:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1725965574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WdaLVYGugrq06HlW6mwl952gy+qYVIf3Fv0x+fewd30=;
	b=ez5UInKF4rWydn95b9wEZCJYpt8H3NO/76foGwzqnOPqaJQL++gWU16lKD861UjJsZF0/3
	NkldsTDWB65+ZvCAN4KoQP5BxGJ4FRgB4oQMqV5DnAONBZo/q2MS2oibPAfOCMDE4lJFIR
	iyVWLcjD4NfplKSQeaGhO8ub1c4/ko3Jh0rF66us8MQOY1VS0648CffSJWjeN007T0079d
	kC0D7BrJga3pM+qazX4pA2DsbW5FmppIy0rQsDAhzkaovGyFsSBuw2wy/u+zoLZNxKCtIC
	u4b4fWMc5uO4eASN8i8EKan6fWBrah/elZJmWpYj4ROi4JiaMNfxUFwsY3CT2A==
Message-ID: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
Date: Tue, 10 Sep 2024 13:52:52 +0300
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: [MAINTAINERS SUMMIT] State of dt-bindings and DT source files, and
 invitation request
To: ksummit@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com

Hello.

I maintain the MediaTek DSA subdriver and some devicetree bindings and
source files for MediaTek hardware.

I am especially interested in the best practices of maintaining dt-bindings
and DT source files.

There's this false impression with some maintainers that, as the
dt-bindings and the DT source files are being hosted on the Linux
repository, Linux drivers have influence over the design of bindings or
fixing DT source files that did not comply with the bindings.

I'd be very interested to be involved in or kick start the efforts to take
dt-bindings and DT source files out of the Linux repository into its own,
separate repository. I believe, this would be a great step in addressing
all the project-dependent bindings of Linux, U-Boot, OpenWrt, and all other
projects, to have a single, unified repository to describe all the hardware
that exists in the world. I am already working towards this goal by
improving the dt-bindings and DT source files on the Linux repository
whenever I can.

I must be quite late to make a topic suggestion but I'd be very happy to be
able to attend to the maintainers summit. I've already registered for the
Linux Plumbers Conference 2024.

Arınç

