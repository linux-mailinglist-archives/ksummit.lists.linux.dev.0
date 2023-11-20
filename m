Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 099F47F1634
	for <lists@lfdr.de>; Mon, 20 Nov 2023 15:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9B3D1F24D99
	for <lists@lfdr.de>; Mon, 20 Nov 2023 14:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FCC15AD9;
	Mon, 20 Nov 2023 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="JL9gYIIO"
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7798014A99
	for <ksummit@lists.linux.dev>; Mon, 20 Nov 2023 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=yQGaai7sLVapjVM6wjHttnMssysY1k04VAU80qnqxZg=;
	t=1700491797; x=1701701397; b=JL9gYIIOZtv+vHmxYpWEkxIOzURsT3U/J93IhrSGdqg0tu+
	6LeOc4jL3T3ltbj9t97HforHOBRAqk+ELcwKbwCmTlGKroNaVl/mhE9tqFsBoMMX1CSwmWQ4uaxiW
	t3PJDgB0NrgW/Ut2Fz9EEfd90dJBAlR7/Gd9BPe9Y6bcJ8gjXaYsNisJsh+OB4eOvVlrJkNrSwXaK
	8QJRmVmBcclPecRr7/t9yQFuqKMUgxtHA9II/4btcJ2W8isktK6bBCkkQqmMOY188CUcFDimZGmgM
	zXNKP6rOHVwJ3v5t174ZnXuM5Qr4zI9YWaCguLtb7aORWQLHrkgHylp59nA71EPg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1r55ak-0000000FCtk-1sQ5;
	Mon, 20 Nov 2023 15:49:38 +0100
Message-ID: <51674537821e0cd37c25c3df80bc83bb2c759ccc.camel@sipsolutions.net>
Subject: Re: [TECH TOPIC] Kernel documentation
From: Johannes Berg <johannes@sipsolutions.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Jani Nikula
	 <jani.nikula@intel.com>, ksummit@lists.linux.dev
Date: Mon, 20 Nov 2023 15:49:37 +0100
In-Reply-To: <20231120154216.683c1203@coco.lan>
References: <87fs6rxppz.fsf@meer.lwn.net> <871qi6glzl.fsf@intel.com>
	 <87v8fiq6cl.fsf@meer.lwn.net>
	 <430ee6bb-2556-4674-ae9d-fd7729bf8afd@oracle.com>
	 <877cmc7cut.fsf@meer.lwn.net> <20231120154216.683c1203@coco.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2023-11-20 at 15:42 +0100, Mauro Carvalho Chehab wrote:
>=20
> There is still a long-term bug on Sphinx C domain logic: it still can't
> have symbols with the same name for different types.

We finally gave up waiting and renamed the symbols in wifi ...

johannes

