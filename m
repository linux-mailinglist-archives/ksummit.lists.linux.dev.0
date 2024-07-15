Return-Path: <ksummit+bounces-1422-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C5C9319C3
	for <lists@lfdr.de>; Mon, 15 Jul 2024 19:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC65BB218BE
	for <lists@lfdr.de>; Mon, 15 Jul 2024 17:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B115461FFA;
	Mon, 15 Jul 2024 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAgWvWQq"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7FD22318
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721065530; cv=none; b=jf1ZHbIpfN3zyRuErPdbCDoSMdrxRGJCrn3o5tIvrMzPo5LKLQmvfTzmpfktsnGYnI/fiNRau5d4ikzrw+0KK1n54SVrQytIqNonQ42xOJKISlVQkoJ2Wy8XwyI6hdqvoROvUjfWecjDSXntUG4HEVP+iHQeMvQAV9zXYNPNzEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721065530; c=relaxed/simple;
	bh=yAC5Tn+8yGz1s6TuLeh813Ig7kHzkm4lnAd2Ktztbq0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cSxA9iz9hJUa5WIs4JlOLeuW7BLTum6UBRfXtU6RiKiM2Y2uI4qLXZkGfKBYfZUovHnyjKP8VMXcQKjUM8yM4X0rvOQ0iIBfd9g0Q2pUPgVDRac9xxls2PUILkQ7c0WOAAkUegRePmaIOR//ez1OjDXpZm65zo6ueNK8oRZhvac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAgWvWQq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435DBC32782;
	Mon, 15 Jul 2024 17:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721065530;
	bh=yAC5Tn+8yGz1s6TuLeh813Ig7kHzkm4lnAd2Ktztbq0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YAgWvWQqHFTx/s7DRB+l8RE7CDM+Cl4yhZSds9p/4fkf3jMoRp+FvTC50rK7keS3M
	 WsJDQNCP3SjQQzWmdGamuP2IdS1nBMC1T0BzNosmiAOJ7MQwlF+tzsfOobcThFobgs
	 Dq3eoff06n/O+Jh18MA88JE66xA62gUw17aofSIinf5zf4nkPpz4vhECP7T+WJgk+m
	 mKik4W5CVQSogmFQqLqC2oTufkhi4N8chbrCe7U4WE/3rhF8VUtkzleXTpHc6sM6dU
	 BsCocujJ4Le6+TgBPesU9hVu8ePakdMz+FLZrBbJWGYQAMLZSXcOkg17k74cK3BLuI
	 MkzYNeTnTI6OA==
Date: Mon, 15 Jul 2024 19:45:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Mimi Zohar <zohar@linux.ibm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Sasha Levin <sashal@kernel.org>,
 ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <20240715194519.6cb6184f@foz.lan>
In-Reply-To: <2024071537-unskilled-boney-2fb6@gregkh>
References: <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
	<ZpQ0soWV6zIpgigf@sashalap>
	<0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
	<CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
	<2024071528-cahoots-reacquire-9eab@gregkh>
	<3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
	<ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
	<202407151434198c3715e9@mail.local>
	<2024071515-zestfully-womankind-1901@gregkh>
	<87h6cqya32.fsf@trenco.lwn.net>
	<2024071537-unskilled-boney-2fb6@gregkh>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 15 Jul 2024 17:10:46 +0200
Greg KH <gregkh@linuxfoundation.org> escreveu:

> as Linus points out, none of us read the documentation we have :(

I guess we all read some version of the documentation, but most likely
several years ago, only re-reading it when something like this comes
up.

Thanks,
Mauro

