Return-Path: <ksummit+bounces-2187-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11602B30327
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCD13AC54E3
	for <lists@lfdr.de>; Thu, 21 Aug 2025 19:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DCD2FABE3;
	Thu, 21 Aug 2025 19:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vke/A2VR"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FBC265CBB
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755805554; cv=none; b=hr3HoFfM+f9TUDneaKVAx5gdQcgxFDh4q7i9i2qla9JIq9qsVbfqjDI6f1iKzBHjFK/DjVggFSdZAVE6QlGloSI3Hfr9uXMaLVPqmZMsOQmUuW+MbD5WwcLxHwWTeY+6uC/jLXenl9zZrRYa69sCCHx7cE+mrork6awQR70+qQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755805554; c=relaxed/simple;
	bh=DVKH0H6w7Hz7kHodfm5Bxi7Mpm4FpasE33wnS8jsazw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z1f2Zvr2SgKpDcnhSHiUY0cKi/5y74OArEEoqsO7Qsczlj/trGX8nwrZ0lHXo4rW5IkA62r1wDBOWFS5aK2edJ23CC+Lg0jaiioW/YFrQI9UEdPywEubDMpFLxfWAoc3M0LDTSLrtVeUkO4+axldKAGg42wsefwJTRK6XH0rhJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vke/A2VR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F05FC4CEEB;
	Thu, 21 Aug 2025 19:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755805553;
	bh=DVKH0H6w7Hz7kHodfm5Bxi7Mpm4FpasE33wnS8jsazw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Vke/A2VR+ETgshvKuwh/mlzEJcf9+7/0964TuV7W80L9PRLlqi1z3FYswMdScodWy
	 PGCtnwbjx6n0qJtdSXRzDzlOcZvNUo0Sx02br9ecRw7K6+fBkgO08lAZd5FMTD46wj
	 1ZDkxpG0incl9VgDx3c8zIYWnrYXQaJw/b9JtJOXnpw0Tf9BS6e+R1XWwTeJH2oykv
	 zrH0lCKsBPfeBujb27xNviEt3ue0ftn3AFwCfh2ZcF2vPR4+kEcNa5MjSr432kdBad
	 30tQLQ+ig8SbjJkuoj5R07Cv3D4K84HrLcdyNLe+OJrFvN4awJVuXW33XbNrLUYHxl
	 Ar9bP9meGV/CA==
Date: Thu, 21 Aug 2025 21:45:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821214547.73b3ded5@foz.lan>
In-Reply-To: <20250821150324.074be768@gandalf.local.home>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
	<9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
	<20250818230729.106a8c48@foz.lan>
	<9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
	<4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
	<d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
	<20250821122329.03c77178@foz.lan>
	<20250821125037.5cf5be3d@gandalf.local.home>
	<20250821193041.398ed30b@foz.lan>
	<DS7PR11MB60772F52AF3A152B5AB04A1CFC32A@DS7PR11MB6077.namprd11.prod.outlook.com>
	<20250821200159.1bcdf0c9@foz.lan>
	<20250821150324.074be768@gandalf.local.home>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 21 Aug 2025 15:03:24 -0400
Steven Rostedt <rostedt@goodmis.org> escreveu:

> On Thu, 21 Aug 2025 20:01:59 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > (**) https://en.wikipedia.org/wiki/The_quick_brown_fox_jumps_over_the_lazy_dog
> > 
> > with has all 23 English characters.  
> 
>                26  ;-)

:-)

Yeah, 23 is on Portuguese (accents are not accounted).

Thanks,
Mauro

