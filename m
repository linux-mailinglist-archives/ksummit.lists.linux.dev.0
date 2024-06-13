Return-Path: <ksummit+bounces-1253-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F21907631
	for <lists@lfdr.de>; Thu, 13 Jun 2024 17:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11DA62846BE
	for <lists@lfdr.de>; Thu, 13 Jun 2024 15:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A901494AD;
	Thu, 13 Jun 2024 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="DvJElxq0";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="DvJElxq0"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70832149C40
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 15:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291519; cv=none; b=lS3na86QcuFwp8KdYxYQ91QM/HVOefPAOw6+uEj5ibhfgTZNar5ZXX79bHamIMFg44Ppn0NSMJ8UIGw+74Zc7kn1xbDO1J4zHU9W+QJo+iHTUrbMjFLI/wBfiqyaylFWt5UKc9Ga8hH2TtfcyutOz85xmiwlY9suQpomEQWHiuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291519; c=relaxed/simple;
	bh=q86gvyTmFIPsebIE+Epkppze8lzKEMvQ5L5JbmdVQUI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p/bq3QL5xAoJEAy/m48inD7UxRMhWVvj7PHGSSqv7OW9cjwKBBzCqRWk8PNt68MMH3lUE2xRMjFo4n7psV5EBOj9EJgLaWpRtjT2iZZZtmHVKdCMnbtwqIXnskHdxGJ8ou6Ig/M0K3wLjBguhdsSjFSud23u9GSBs4vL16aek5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=DvJElxq0; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=DvJElxq0; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718291516;
	bh=q86gvyTmFIPsebIE+Epkppze8lzKEMvQ5L5JbmdVQUI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=DvJElxq0cPl0N5nMSQf3nxRna6oGc9BMJsQ4pFAhc9XH1MDcwhl2TV6SmzsR6xCDA
	 Tx32amDVGMXsdS8LfxXYJUIynN3nTLYXbmDXw1Oi0V4F/7To9/oJ44UGw3WC+sV9a0
	 VUuH5E59CYmjZ/WaczP+Q6GijHIyqw1a4pJEFQ9E=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 9DF78128646B;
	Thu, 13 Jun 2024 11:11:56 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id DURB9vFIuiCJ; Thu, 13 Jun 2024 11:11:56 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718291516;
	bh=q86gvyTmFIPsebIE+Epkppze8lzKEMvQ5L5JbmdVQUI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=DvJElxq0cPl0N5nMSQf3nxRna6oGc9BMJsQ4pFAhc9XH1MDcwhl2TV6SmzsR6xCDA
	 Tx32amDVGMXsdS8LfxXYJUIynN3nTLYXbmDXw1Oi0V4F/7To9/oJ44UGw3WC+sV9a0
	 VUuH5E59CYmjZ/WaczP+Q6GijHIyqw1a4pJEFQ9E=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id E6EB9128627B;
	Thu, 13 Jun 2024 11:11:55 -0400 (EDT)
Message-ID: <78bfcb1f27462d160457b36f302ae4e12083493a.camel@HansenPartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Greg KH <greg@kroah.com>
Cc: Sasha Levin <sashal@kernel.org>, Thorsten Leemhuis
 <linux@leemhuis.info>,  "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Date: Thu, 13 Jun 2024 11:11:54 -0400
In-Reply-To: <2024061305-swimming-politely-30f3@gregkh>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
	 <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>
	 <ZmruqWDTG2PK-rbu@sashalap>
	 <dea93a79fc457d8a5424a18f8c138a4f75def064.camel@HansenPartnership.com>
	 <2024061305-swimming-politely-30f3@gregkh>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2024-06-13 at 16:02 +0200, Greg KH wrote:
> On Thu, Jun 13, 2024 at 09:56:56AM -0400, James Bottomley wrote:
> > On Thu, 2024-06-13 at 09:06 -0400, Sasha Levin wrote:
[...]
> > > Could you provide a concrete example? This shouldn't happen.
> > 
> > This one has no fixes or cc stable:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37f1663c91934f664fb850306708094a324c227c
> > 
> > Yet here it is backported:
> > 
> > Message-id: 20240603121056.1837607-1-sashal@kernel.org
> > 
> > (I can't give a lore reference because conveniently it was a
> > personal cc with no tracked mailing list).
> > 
> > I picked that one because we discovered a bug with the strlcpy to
> > strscpy conversions in SCSI which it looks like this backport has.
> 
> It says, in the commit message:
>          Stable-dep-of: c3408c4ae041 ("scsi: qla2xxx: Avoid possible
> run-time warning with long model_num")
> 
> That is why it was backported.

Well, that still tracks back to a patch which wasn't tagged:
c3408c4ae041 is actually fixing a bug in 527e9b704c3d which is another
of the strlcpy to strscpy patches which also has no cc:stable or fixes
tag:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=527e9b704c3d

James


