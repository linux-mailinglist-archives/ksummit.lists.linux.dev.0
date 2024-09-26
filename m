Return-Path: <ksummit+bounces-1577-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B7986D6B
	for <lists@lfdr.de>; Thu, 26 Sep 2024 09:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A5401C21927
	for <lists@lfdr.de>; Thu, 26 Sep 2024 07:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40FA18C00A;
	Thu, 26 Sep 2024 07:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="naSGEHnf"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A8D186298;
	Thu, 26 Sep 2024 07:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727335415; cv=none; b=ERU8I9QwjcekitAJDJxTSOkUMW5XnuanLD4XLBA30njMyOQyds9z0dYKk9MknPsznB7vHhl8ZknaKMe26B5vKlNce3lXgL3uklc9W/CjbzXVr79UAYS73JwZRTxMGjLgOrLUMW0ZUXafYR9D0JUtR6qUHqXXBJ07LRhh7Dxhq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727335415; c=relaxed/simple;
	bh=tYV2H5br9kWhzl96UUGjXTWhmlY2Pw4qsC37WMIpyJY=;
	h=From:To:Cc:Subject:References:Date:Message-ID:MIME-Version:
	 Content-Type; b=FyMz/HNfh5eleOL2+UiL2VyK6bsekcTNvJvWHbD4Ree6zu//w5roD0NWR964hUgV9rlC6Fs7bP0+nnObPLbsEG+Bvk9oxUyNVCfeGLLXx6wc3y8qLoEZHmdDelZwWFEQ62Ib/ilaXor7VpkQ6vXV/XCah6Q9x9o7oCelOzTP6+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=naSGEHnf; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 62BD742B29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1727335412; bh=djX+5aMk6cq7Bv8YpnuHUZZBh5ZZwldaGICdubCGOsQ=;
	h=From:To:Cc:Subject:References:Date:From;
	b=naSGEHnf3vNT7gz4mncLIHkOI/n5CcmMT6ToDgWAjCVYUgAXVtxHoS3RZF4ZSnTks
	 fgu03mkJgh7zuo+PZCbMC5cu+kpbuA/CuRDDOjhM+6Q0UTAcqRu7PRdhpKGmgOZ2GC
	 9AcCouBkNSLEYLFnPKfNrZJGAB9lwjIyrIzga5qO1QUGXiNCgc60jN5478ViUOiwrT
	 Sr1YVbT94iSkli3iIJhnXW1QLtswvoeiV+ev/I2mpqmC+Fmalnn+pi9m2Cw8/1JJuj
	 IfWTnw9CdZ/28ImEa2etgGTktuoTqqoSrX8TCrnbO5FyiuTLU4Zwa11LpdB9AFlyiP
	 qNlsJe/w4zdug==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 62BD742B29;
	Thu, 26 Sep 2024 07:23:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 tech-board-discuss@lists.linuxfoundation.org
Cc: tab-elections@lists.linux.dev
Subject: Last reminder: TAB voting closes September 27
References: <871q1enx0g.fsf@trenco.lwn.net>
Date: Thu, 26 Sep 2024 01:23:28 -0600
Message-ID: <874j62g9ov.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

One last reminder that voting for members of the Linux Foundation
Technical Advisory Board is open; it will end after September 27,
anywhere on earth.  I'll post the results shortly thereafter, and then
I'll stop spamming you all about this - honest.

If you have not yet voted, you still have a bit more time to get it
done.

Thanks,

jon

-------------------- Start of forwarded message --------------------
From: Jonathan Corbet <corbet@lwn.net>
To: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 tech-board-discuss@lists.linuxfoundation.org
Cc: tab-elections@lists.linux.dev
Subject: TAB election 2024 voting started
Date: Fri, 20 Sep 2024 09:51:59 -0600

In the end, we had eleven nominations for this year's TAB election:

 - Amit Shah
 - Dan Williams
 - Daniel Borkmann
 - Dave Hansen
 - Jakub Kicinski
 - Jiri Kosina
 - Kees Cook
 - Lorenzo Pieralisi
 - Miguel Ojeda
 - Ricardo Neri
 - Shuah Khan

Voting has begun, and everybody who is eligible for an automatic ballot,
or who has requested a ballot, should have received voting instructions
from the CIVS system.  If you were expecting a ballot and did not get
it, then:

- Perhaps it ended up in your spam folder?

- Have you enabled your email address in the CIVS system?  It will not
  send you anything until you have done that.  The place to enable an
  address is https://civs1.civs.us/cgi-bin/opt_in.pl

Please contact us at tab-elections@lists.linux.dev if you have
difficulties or questions.

Voting will remain open through September 27.

Thanks,

The TAB elections team
-------------------- End of forwarded message --------------------

