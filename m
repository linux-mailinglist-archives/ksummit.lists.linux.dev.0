Return-Path: <ksummit+bounces-2192-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D3B307E6
	for <lists@lfdr.de>; Thu, 21 Aug 2025 23:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A60291D24C8D
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947D6393DE4;
	Thu, 21 Aug 2025 20:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="GM3OqV9w"
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F487393DD9
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755809996; cv=none; b=Gwe0qyhXB6HtT3190aas4VHUpjr3ssNnEdM34bm9sxsyyB+X2unQ6NdU7E1IXAzfUYn9OUc4u2l06m0Op5vwEdgoIamBgB0Q+zs+mthscwmwiJOVrfj0WtWcDtv54ful/k36XnVSWlriGxc4oXbyk5sVSBVnFDrZdRT3RsHYryM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755809996; c=relaxed/simple;
	bh=GpcCxn9GfF5EUrbeHIDHmZBthwjprD4p8VNgAbhXB74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbvQmE1u/bRIqIRzIA4qME/tHRWoYWMKFWyn1+RTZDJww6skBLVRgm9o2p5evcTNrwf3aTt+5PsJ7n6jwbk4OGd+UjxzFTuA2Z+75yBEHX4I/aFP1378brlMK0bJwIl/MeWgUHXlwpjN0CovVdwCGeSBhnYtt9doaQC6iXb5jMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=GM3OqV9w; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-113-69.bstnma.fios.verizon.net [173.48.113.69])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 57LKxonH010259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 16:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1755809992; bh=1UZbu40+NQ+L5f8C12ebvpREaa+BoEnTLmppeBFRg54=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=GM3OqV9wnYmT9cWN6othS4pgEltxzdaGFZkj4zsS/P7WuhwQaNtEDNw0Qxsw0awmi
	 DAKCTnSUzenocS30OaAzz6+5glF17HRa5v+vrEAgNjdL2Z4O4f3DBwuyMJAtZBGjwc
	 wo3OHtGbbdxbyS/vgfNMMRB/L8vrchOwjmiWq9mre8iSeigy+CeIhq0jxFecQ5R8Dn
	 m6ZLIgKeduQ0d/tNz3qN1a/mxBHEaPiNyVyZTpzIuVVIGyelsCejACShbcnagcvqgv
	 dV/LCkxIGl81R6EuirgNBJVkM1nXL97//lLmblo9p8UrF/5/e76MxxNVj4WHswTpS2
	 fkGV00vXZl4Rw==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id BC2CF2E00D6; Thu, 21 Aug 2025 16:59:50 -0400 (EDT)
Date: Thu, 21 Aug 2025 16:59:50 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINER SUMMIT] Adding more formality around feature
 inclusion and ejection
Message-ID: <20250821205950.GB1284215@mit.edu>
References: <fc0994de40776609928e8e438355a24a54f1ad10.camel@HansenPartnership.com>
 <20250821203407.GA1284215@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821203407.GA1284215@mit.edu>

On Thu, Aug 21, 2025 at 04:34:07PM -0400, Theodore Ts'o wrote:
> (2) is a very hard problem, and so there is a tendency to focus on
> solving problems (1) and (2).

 "solving problems (1) and (3) instead."

Apologies for the typo.

						- Ted

