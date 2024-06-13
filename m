Return-Path: <ksummit+bounces-1238-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B627906AA7
	for <lists@lfdr.de>; Thu, 13 Jun 2024 13:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2626B217EF
	for <lists@lfdr.de>; Thu, 13 Jun 2024 11:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C247A1428FD;
	Thu, 13 Jun 2024 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="Cnv4PB4r"
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CE7DDB1
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 11:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718276569; cv=none; b=Ah5BhlaEQVGZV2vMdyawSrHGHPJIO02SMbo1i/hj8pH7Ta89Zv4s+4glxeBiahWrqKy2UqcRXgl7a6WJeWBPeKTCfXUULVDutFfC0SL07MudUTn4l+1kz0dKRcXINbNbvpV7tCMavEeUv8ap7zahDwpKvsM59VFVVUbWHKS7wBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718276569; c=relaxed/simple;
	bh=Gum145wbaYIIq2azkoyaeSc3jFdjUYNoJO5yA8BZxMI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fkUGe3bAgQHvP3al643dBJwT1SZrtb2g7KvdhxkzAjpuv2fa+Wrnr17aqMM8K9XhhIxHTmNTlL6XgMaoO6LttzZAhh3lw7Jtzm5K+IyYp0BzmGQaRjMvcbaAL9/wvVP43CNk/F9HWqLSfvYvWRWzwrT51jDhSMM3lAh+jPL2rR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=Cnv4PB4r; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Gum145wbaYIIq2azkoyaeSc3jFdjUYNoJO5yA8BZxMI=;
	t=1718276567; x=1719486167; b=Cnv4PB4r20T6CZHq+nlimwmVe0f4iF6ikxhU7w31eQOFUFa
	Cz4MQsgZ8QatgIyftQX3GSrmw1TZ897f1B7C2Mkr5a4zJlv98VQcuKb50Fw32/FeIwoNKtNlN93OV
	LTB/a3RwjcUdpTtNDVG9YvhpafWKZXMaPsO4dNKXuPHhbb8OL7uN0dY7xPmEreZ0FSkO5V2TW+0A5
	PkuXN35IQ/yPxguA23cWutRUE4WvTqe1qE46HloWg4fSmEMyan6/9nF5xi5pLU5iMTdeA8BhYDZLW
	SzimKpd/sJAcVlpcbuuitGfgV71g1JkfUbCCEFgSOiPd80aqvQaPtJTVoJ4hO2Fg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sHiE8-0000000Bj3B-3pNm;
	Thu, 13 Jun 2024 13:02:45 +0200
Message-ID: <68ad780601dd5788ab7c18e8ba683e808cf98f4c.camel@sipsolutions.net>
Subject: Re: [MAINTAINERS SUMMIT] [2/4] Ensure recent mainline regression
 are fixed in latest stable series
From: Johannes Berg <johannes@sipsolutions.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev"
	 <ksummit@lists.linux.dev>
Date: Thu, 13 Jun 2024 13:02:44 +0200
In-Reply-To: <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	 <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2024-06-13 at 10:32 +0200, Thorsten Leemhuis wrote:
>=20
> I know I'm asking a lot here, especially from the file system folks due
> to the testing this will require. And I fully understand the
> participation in stable maintenance always has been and still is
> optional for mainline developers -- and that this would change it.
>=20
> But I'm bringing this up anyway, as users afaics expect "fix recently
> introduced problems with new minor releases'

You are saying that users can have it both ways: not test each release,
but actually get fixes in each release...

So no, I strongly object to putting *even* more work onto maintainers,
basically making us all responsible for stable releases.

johannes

